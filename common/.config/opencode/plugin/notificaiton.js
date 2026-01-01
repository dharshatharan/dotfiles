export const NotificationPlugin = async ({ client, $ }) => {
  return {
    event: async ({ event }) => {
      // Send notification on session completion
      if (event.type === "session.idle") {
        await $`terminal-notifier -message "Session completed!" -title "opencode"'`;
      }
    },
  };
};
