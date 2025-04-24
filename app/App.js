import { StyleSheet, Text, View, SafeAreaView } from 'react-native';
import { WebView } from 'react-native-webview';
import { useEffect, useState } from 'react';
import Constants from 'expo-constants';

export default function App() {
  const [ip, setIp] = useState('');

  useEffect(() => {
    const fetchMetroIp = () => {
      if (__DEV__) {
        const debuggerHost =
          Constants.manifest?.debuggerHost ||
          Constants.manifest2?.extra?.expoGo?.debuggerHost;
        const metroIp = debuggerHost?.split(':')[0];
        console.log('Fetched Metro IP Address:', metroIp);
        setIp(metroIp);
      }
    };

    fetchMetroIp();
  }, []);

  return (
    <SafeAreaView style={styles.safeArea}>
      {ip ? (
        <WebView
          style={styles.webView}
          source={{
            uri: `http://${ip}:3000`,
          }}
        />
      ) : (
        <Text>Loading...</Text>
      )}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safeArea: {
    flex: 1, // Đảm bảo SafeAreaView chiếm toàn bộ màn hình
  },
  webView: {
    flex: 1, // Đảm bảo WebView chiếm toàn bộ không gian bên trong SafeAreaView
  },
});
