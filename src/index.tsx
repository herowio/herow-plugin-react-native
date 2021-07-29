import { NativeModules } from 'react-native';

type HerowSdkModuleType = {
  initialize(username: string, password: string): void;
  setCustomId(customId: string): void;
  removeCustomId(): void;
  acceptOptin(): void;
  refuseOptin(): void;
  launchClickAndCollect(): void;
  stopClickAndCollect(): void;
};

const { HerowSdkModule } = NativeModules;

export default HerowSdkModule as HerowSdkModuleType;
