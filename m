Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 096ABB008F0
	for <lists+samba-technical@lfdr.de>; Thu, 10 Jul 2025 18:38:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wOuVRWsKil6+MLyNcQqmvQFowMb64Q93/V1uIe0IYLs=; b=u9p6wa3OlhLFQRKZYINyANUtt8
	wuSiiPVh6MGn27lgA/fySuM/dfu3LQe4M1FL8zbop9bjCnguKczhYmzpdCX98hU8eps1URF8iY9Vk
	hGzQZFUgCrQ2B0EwtHhq0jlIMnTbQrQVblwZYN/ZGCiP0ltKlPmmoA4HzmPMimOPFTti/A/lIJ/cr
	HqTkpEmMvvYwZ5up0unEMZVjQzRHjxc+MszsjLF8xn9P1HzRy8zLoOeT6RHV/xpmLydsmybVQri1G
	gsiBa8PFgepX0TtQnAVaQUmPcLT5AEuuDPt/dZ1+9S4x166wnQNFRjKBEzNvJXG6g584d7b0tBahL
	9SOK+tKA==;
Received: from ip6-localhost ([::1]:24788 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uZuHB-00Awkr-GR; Thu, 10 Jul 2025 16:37:37 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:46203) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uZuH6-00Awkj-QQ
 for samba-technical@lists.samba.org; Thu, 10 Jul 2025 16:37:35 +0000
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-7048c49f1f1so9867636d6.0
 for <samba-technical@lists.samba.org>; Thu, 10 Jul 2025 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752165451; x=1752770251; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wOuVRWsKil6+MLyNcQqmvQFowMb64Q93/V1uIe0IYLs=;
 b=VaiMCrLc6PnuTMwxpNBc5EG9zbJtWhwwdUW41mpZPE1j3yZAToj9oPAyZ6JBVNDtdv
 SnwwSUjRjeFXNJJMWnH2nT89Mm3r+dakJHq+WqoiNk86bxhXlX7M1U8fbE1TIB+czNNH
 8sqDQy6M9rEe/N9YFgT0pgkyeHJ7uBWrU9NgM76aUCavlDu3c55WroL0ijn8rSWFxVpp
 uSIQ6abo/uqtDmHQKm2cr7lMipn+4s9VZ7gPXrfWqbURPPCj1fvaknjh7QThmdlai5wG
 F6GNuoExf9RVdn19uXKEBa1wN+ODdJOJlSeEBx/wfbqCZd3pFuHk0SBQXSfg+G/5yuy7
 YT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752165451; x=1752770251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wOuVRWsKil6+MLyNcQqmvQFowMb64Q93/V1uIe0IYLs=;
 b=VyyW6yQwQBK+wShIlRu6+ANuWNTJ4xX/fjHcYPjfMehEImctcdT8DHCF+uszVKGNAS
 k3PliQycWTeVmzCqQyUfekA59F0j0MjYLy5CIhk1UGB16jAQTrtibP+Rf1xyZDoDF/zv
 2QSpk1TDmDtira6yQAi2d+zBRoO7knv6zFpotnejjgd4/F0s2AuiD73ZOQYSQyY1RFjw
 K3MjIBw6X9qfcMY/vUrZ+psPdlTS4BTjf3OHgJG95WHyeH69tg+A5fbV621C7cM5HUoy
 oEWHixs/sQSPnArEYmBcf2yoOMH5rlqtauAvfYBeDq/M9wqUfAE4ygZqw+X1FysN88an
 Qj3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlkJqXKe01zc6a5S9XXyF11hWBP2APWe4qPkzP+YUWF6uAX6Sh1qtAHBzHEJRiHjki3euWqjp3P5SNs8vYMjM=@lists.samba.org
X-Gm-Message-State: AOJu0YwZmzjyAiUo0cigNDvjCnb5F5/8iQZ8uG6lO4ujf32WnybZu+42
 NbgyeFj8bzbtnGfXeI9fuujE7q4INGQi3eO64nApnzEtRe7bYuZ2WaXuEMsMXTvvhL4k6iJCFC5
 W1s9R3r7I3cmQduPx9ZTHtw+R0VJUKlplcc/h0Lw=
X-Gm-Gg: ASbGncs9vUm/pg7fq8czu5qOpnuYhQ3Ko0yES63n45MRVo7tD9TmpU6EDOnlH3fGtC8
 3w0DN6UXMXkatAaLO7yIb458qkTNfLqWZwrv/Y6HJHSOMsJ4SxWBjYjarZGfXjA4ZPnQGx/zZ9e
 m73meBJuy/65/DGJAuF/L76Gya2zBD2USh8GGDe66Z+KFm7x4x0jupap9bGSCfKPdruy7VA+lex
 74=
X-Google-Smtp-Source: AGHT+IHTIa+Whh5jYxCWZ5uPC+PCbXPtfJjsYhfi+uGQgwb4su2e60S4jO4VgsJ9/JfaOX6Z57lEOJaaW34KcF8Vd3w=
X-Received: by 2002:a05:6214:5a02:b0:704:8026:17d6 with SMTP id
 6a1803df08f44-704a3519b6bmr649376d6.7.1752165450751; Thu, 10 Jul 2025
 09:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvKXfktSaikDTAspOTvOitpP0BDL6+GdVvptjSsKoZUNg@mail.gmail.com>
In-Reply-To: <CAH2r5mvKXfktSaikDTAspOTvOitpP0BDL6+GdVvptjSsKoZUNg@mail.gmail.com>
Date: Thu, 10 Jul 2025 11:37:19 -0500
X-Gm-Features: Ac12FXzaeFhFZ40lkYMBMIPABQqUk_cWFAlMeQl5XpRDU2f-AJqkze1Ah8H-exk
Message-ID: <CAH2r5mtxgDNTpJT4isgm+Wf9GaBsJ5xS5uC1rFo+s9XZDJG=Lg@mail.gmail.com>
Subject: Re: directory lease bug where newly created files are ignored till
 lease times out
To: Bharath S M <bharathsm@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Henrique Carvalho <henrique.carvalho@suse.com>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Shyam Prasad <nspmangalore@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I did see a refcount underflow bug with Bharath's original patch that
reproduces consistently to Samba (was able to reproduce it only once
with my updated patch, and only with "sfu" mount option) running
generic/001 and generic/647

[19270.328414] run fstests generic/001 at 2025-07-10 11:33:17
[19270.478576] ------------[ cut here ]------------
[19270.478578] refcount_t: underflow; use-after-free.
[19270.478587] WARNING: CPU: 0 PID: 283118 at lib/refcount.c:28
refcount_warn_saturate+0xfb/0x150
[19270.478593] Modules linked in: cifs(OE) nfnetlink_queue
nfnetlink_log ib_core rfcomm snd_seq_dummy snd_hrtimer snd_seq_midi
snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device xt_conntrack
nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 bridge stp llc xfrm_user xfrm_algo xt_addrtype
nft_compat nf_tables nls_utf8 cachefiles cifs_arc4 nls_ucs2_utils
cifs_md4 netfs ccm overlay cmac algif_hash algif_skcipher af_alg qrtr
bnep elan_i2c sch_fq_codel intel_uncore_frequency
intel_uncore_frequency_common snd_sof_pci_intel_cnl
snd_sof_intel_hda_generic soundwire_intel intel_tcc_cooling iwlmvm
snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac_hda
snd_sof_intel_hda_mlink snd_sof_intel_hda soundwire_cadence
snd_sof_pci snd_sof_xtensa_dsp snd_sof cmdlinepart spi_nor
x86_pkg_temp_thermal intel_powerclamp ee1004 mei_pxp mtd mei_hdcp
intel_rapl_msr snd_sof_utils coretemp snd_soc_acpi_intel_match
mac80211 snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation
snd_soc_acpi soundwire_bus
[19270.478642]  snd_soc_sdca crc8 snd_soc_avs kvm_intel btusb btrtl
btintel snd_soc_hda_codec btbcm snd_hda_ext_core binfmt_misc btmtk
nls_iso8859_1 snd_ctl_led think_lmi kvm snd_soc_core libarc4
snd_hda_codec_realtek snd_hda_codec_generic snd_hda_scodec_component
snd_hda_codec_hdmi nouveau uvcvideo snd_compress ac97_bus iwlwifi
snd_pcm_dmaengine snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi
videobuf2_vmalloc irqbypass snd_hda_codec uvc videobuf2_memops
polyval_clmulni processor_thermal_device_pci_legacy
ghash_clmulni_intel videobuf2_v4l2 processor_thermal_device sha1_ssse3
processor_thermal_wt_hint snd_hda_core aesni_intel videobuf2_common
i2c_i801 platform_temperature_control rapl processor_thermal_rfim
videodev snd_hwdep processor_thermal_rapl i2c_smbus bluetooth
intel_cstate cfg80211 snd_pcm firmware_attributes_class
intel_wmi_thunderbolt mc wmi_bmof i2c_mux nvidiafb spi_intel_pci
intel_rapl_common mei_me spi_intel processor_thermal_wt_req mei
processor_thermal_power_floor vgastate processor_thermal_mbox
[19270.478687]  snd_timer fb_ddc intel_soc_dts_iosf intel_pch_thermal
thinkpad_acpi nvram int3403_thermal int340x_thermal_zone
intel_pmc_core pmt_telemetry pmt_class int3400_thermal
acpi_thermal_rel intel_pmc_ssram_telemetry acpi_pad intel_vsec joydev
input_leds mac_hid serio_raw nfsd mxm_wmi drm_gpuvm gpu_sched
auth_rpcgss drm_ttm_helper ttm nfs_acl drm_exec lockd
drm_display_helper cec grace rc_core i2c_algo_bit msr sunrpc
parport_pc ppdev lp parport nvme_fabrics efi_pstore nfnetlink
dmi_sysfs ip_tables x_tables autofs4 xfs btrfs blake2b_generic raid10
raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor
raid6_pq raid1 raid0 linear wacom ucsi_acpi hid_generic rtsx_pci_sdmmc
8250_dw typec_ucsi nvme typec usbhid e1000e psmouse nvme_core snd
thunderbolt hid rtsx_pci intel_lpss_pci nvme_keyring intel_lpss
nvme_auth idma64 soundcore video platform_profile sparse_keymap
pinctrl_cannonlake wmi [last unloaded: cifs(OE)]
[19270.478746] CPU: 0 UID: 0 PID: 283118 Comm: fill Tainted: G
W  OE       6.16.0-rc5+ #68 PREEMPT(voluntary)
[19270.478749] Tainted: [W]=3DWARN, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
[19270.478750] Hardware name: LENOVO 20MAS08500/20MAS08500, BIOS
N2CET70W (1.53 ) 03/11/2024
[19270.478752] RIP: 0010:refcount_warn_saturate+0xfb/0x150
[19270.478754] Code: eb 9a 0f b6 1d c2 6f ed 01 80 fb 01 0f 87 98 d2
6d ff 83 e3 01 75 85 48 c7 c7 90 d5 c5 ba c6 05 a6 6f ed 01 01 e8 e5
52 82 ff <0f> 0b e9 6b ff ff ff 0f b6 1d 94 6f ed 01 80 fb 01 0f 87 55
d2 6d
[19270.478756] RSP: 0018:ffffcbe9421876b0 EFLAGS: 00010246
[19270.478758] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000000=
00000
[19270.478760] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000
[19270.478761] RBP: ffffcbe9421876b8 R08: 0000000000000000 R09: 00000000000=
00000
[19270.478762] R10: 0000000000000000 R11: 0000000000000000 R12: ffff894cfce=
356c8
[19270.478763] R13: 0000000040000000 R14: ffff894f3e9d9000 R15: ffff894cfcc=
ef000
[19270.478764] FS:  0000799bac98f740(0000) GS:ffff8953db67d000(0000)
knlGS:0000000000000000
[19270.478766] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19270.478767] CR2: 0000616781e94004 CR3: 00000008106c8004 CR4: 00000000003=
726f0
[19270.478769] Call Trace:
[19270.478770]  <TASK>
[19270.478773]  close_cached_dir+0x51/0x60 [cifs]
[19270.478828]  cifs_do_create.isra.0+0x832/0xb30 [cifs]
[19270.478879]  cifs_atomic_open+0x20e/0x610 [cifs]
[19270.478928]  ? obj_cgroup_charge_account+0x139/0x370
[19270.478936]  path_openat+0xc4a/0x1340
[19270.478939]  ? path_openat+0xc4a/0x1340
[19270.478943]  do_filp_open+0xd3/0x190
[19270.478948]  do_sys_openat2+0x88/0xf0
[19270.478951]  __x64_sys_openat+0x54/0xa0
[19270.478953]  x64_sys_call+0x24cf/0x2660
[19270.478955]  do_syscall_64+0x80/0x4a0
[19270.478959]  ? do_fault+0x2ad/0x570
[19270.478961]  ? __handle_mm_fault+0x838/0x1070
[19270.478965]  ? count_memcg_events+0x180/0x200
[19270.478967]  ? handle_mm_fault+0xbc/0x300
[19270.478970]  ? do_user_addr_fault+0x1d2/0x8d0
[19270.478973]  ? irqentry_exit_to_user_mode+0x2e/0x270
[19270.478976]  ? irqentry_exit+0x43/0x50
[19270.478978]  ? exc_page_fault+0x90/0x1b0
[19270.478981]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[19270.478983] RIP: 0033:0x799bac71b175
[19270.478984] Code: 83 e2 40 75 50 89 f0 f7 d0 a9 00 00 41 00 74 45
80 3d de fe 0e 00 00 74 60 89 da 4c 89 e6 bf 9c ff ff ff b8 01 01 00
00 0f 05 <48> 3d 00 f0 ff ff 0f 87 7f 00 00 00 48 8b 55 b8 64 48 2b 14
25 28
[19270.478986] RSP: 002b:00007fff5f11f0f0 EFLAGS: 00000202 ORIG_RAX:
0000000000000101
[19270.478988] RAX: ffffffffffffffda RBX: 0000000000000241 RCX: 0000799bac7=
1b175
[19270.478989] RDX: 0000000000000241 RSI: 00007fff5f12025c RDI: 00000000fff=
fff9c
[19270.478990] RBP: 00007fff5f11f160 R08: 0000000000000004 R09: 00000000000=
00001
[19270.478991] R10: 00000000000001b6 R11: 0000000000000202 R12: 00007fff5f1=
2025c
[19270.478992] R13: 0000616781e94004 R14: 0000616781e94004 R15: 0000799bac9=
f0000
[19270.478996]  </TASK>
[19270.478997] ---[ end trace 0000000000000000 ]---
[19282.012288] run fstests generic/637 at 2025-07-10 11:33:29
[19282.222173] ------------[ cut here ]------------
[19282.222175] refcount_t: underflow; use-after-free.
[19282.222183] WARNING: CPU: 6 PID: 285657 at lib/refcount.c:28
refcount_warn_saturate+0xfb/0x150
[19282.222189] Modules linked in: cifs(OE) nfnetlink_queue
nfnetlink_log ib_core rfcomm snd_seq_dummy snd_hrtimer snd_seq_midi
snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device xt_conntrack
nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 bridge stp llc xfrm_user xfrm_algo xt_addrtype
nft_compat nf_tables nls_utf8 cachefiles cifs_arc4 nls_ucs2_utils
cifs_md4 netfs ccm overlay cmac algif_hash algif_skcipher af_alg qrtr
bnep elan_i2c sch_fq_codel intel_uncore_frequency
intel_uncore_frequency_common snd_sof_pci_intel_cnl
snd_sof_intel_hda_generic soundwire_intel intel_tcc_cooling iwlmvm
snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac_hda
snd_sof_intel_hda_mlink snd_sof_intel_hda soundwire_cadence
snd_sof_pci snd_sof_xtensa_dsp snd_sof cmdlinepart spi_nor
x86_pkg_temp_thermal intel_powerclamp ee1004 mei_pxp mtd mei_hdcp
intel_rapl_msr snd_sof_utils coretemp snd_soc_acpi_intel_match
mac80211 snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation
snd_soc_acpi soundwire_bus
[19282.222239]  snd_soc_sdca crc8 snd_soc_avs kvm_intel btusb btrtl
btintel snd_soc_hda_codec btbcm snd_hda_ext_core binfmt_misc btmtk
nls_iso8859_1 snd_ctl_led think_lmi kvm snd_soc_core libarc4
snd_hda_codec_realtek snd_hda_codec_generic snd_hda_scodec_component
snd_hda_codec_hdmi nouveau uvcvideo snd_compress ac97_bus iwlwifi
snd_pcm_dmaengine snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi
videobuf2_vmalloc irqbypass snd_hda_codec uvc videobuf2_memops
polyval_clmulni processor_thermal_device_pci_legacy
ghash_clmulni_intel videobuf2_v4l2 processor_thermal_device sha1_ssse3
processor_thermal_wt_hint snd_hda_core aesni_intel videobuf2_common
i2c_i801 platform_temperature_control rapl processor_thermal_rfim
videodev snd_hwdep processor_thermal_rapl i2c_smbus bluetooth
intel_cstate cfg80211 snd_pcm firmware_attributes_class
intel_wmi_thunderbolt mc wmi_bmof i2c_mux nvidiafb spi_intel_pci
intel_rapl_common mei_me spi_intel processor_thermal_wt_req mei
processor_thermal_power_floor vgastate processor_thermal_mbox
[19282.222285]  snd_timer fb_ddc intel_soc_dts_iosf intel_pch_thermal
thinkpad_acpi nvram int3403_thermal int340x_thermal_zone
intel_pmc_core pmt_telemetry pmt_class int3400_thermal
acpi_thermal_rel intel_pmc_ssram_telemetry acpi_pad intel_vsec joydev
input_leds mac_hid serio_raw nfsd mxm_wmi drm_gpuvm gpu_sched
auth_rpcgss drm_ttm_helper ttm nfs_acl drm_exec lockd
drm_display_helper cec grace rc_core i2c_algo_bit msr sunrpc
parport_pc ppdev lp parport nvme_fabrics efi_pstore nfnetlink
dmi_sysfs ip_tables x_tables autofs4 xfs btrfs blake2b_generic raid10
raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor
raid6_pq raid1 raid0 linear wacom ucsi_acpi hid_generic rtsx_pci_sdmmc
8250_dw typec_ucsi nvme typec usbhid e1000e psmouse nvme_core snd
thunderbolt hid rtsx_pci intel_lpss_pci nvme_keyring intel_lpss
nvme_auth idma64 soundcore video platform_profile sparse_keymap
pinctrl_cannonlake wmi [last unloaded: cifs(OE)]
[19282.222343] CPU: 6 UID: 0 PID: 285657 Comm: touch Tainted: G
W  OE       6.16.0-rc5+ #68 PREEMPT(voluntary)
[19282.222347] Tainted: [W]=3DWARN, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
[19282.222348] Hardware name: LENOVO 20MAS08500/20MAS08500, BIOS
N2CET70W (1.53 ) 03/11/2024
[19282.222349] RIP: 0010:refcount_warn_saturate+0xfb/0x150
[19282.222352] Code: eb 9a 0f b6 1d c2 6f ed 01 80 fb 01 0f 87 98 d2
6d ff 83 e3 01 75 85 48 c7 c7 90 d5 c5 ba c6 05 a6 6f ed 01 01 e8 e5
52 82 ff <0f> 0b e9 6b ff ff ff 0f b6 1d 94 6f ed 01 80 fb 01 0f 87 55
d2 6d
[19282.222354] RSP: 0018:ffffcbe94a5737a0 EFLAGS: 00010246
[19282.222356] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000000=
00000
[19282.222357] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000
[19282.222358] RBP: ffffcbe94a5737a8 R08: 0000000000000000 R09: 00000000000=
00000
[19282.222359] R10: 0000000000000000 R11: 0000000000000000 R12: ffff894cfce=
356c8
[19282.222360] R13: 0000000040000000 R14: ffff894f3e9d9000 R15: ffff894cfcc=
ef000
[19282.222362] FS:  00007f4576751740(0000) GS:ffff8953db97d000(0000)
knlGS:0000000000000000
[19282.222363] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19282.222364] CR2: 00007f45764f59d0 CR3: 00000006fec34005 CR4: 00000000003=
726f0
[19282.222366] Call Trace:
[19282.222367]  <TASK>
[19282.222370]  close_cached_dir+0x51/0x60 [cifs]
[19282.222425]  cifs_do_create.isra.0+0x832/0xb30 [cifs]
[19282.222476]  cifs_atomic_open+0x20e/0x610 [cifs]
[19282.222530]  ? obj_cgroup_charge_account+0x139/0x370
[19282.222541]  path_openat+0xc4a/0x1340
[19282.222545]  ? path_openat+0xc4a/0x1340
[19282.222549]  do_filp_open+0xd3/0x190
[19282.222554]  do_sys_openat2+0x88/0xf0
[19282.222557]  __x64_sys_openat+0x54/0xa0
[19282.222559]  x64_sys_call+0x24cf/0x2660
[19282.222562]  do_syscall_64+0x80/0x4a0
[19282.222565]  ? count_memcg_events+0x180/0x200
[19282.222568]  ? handle_mm_fault+0xbc/0x300
[19282.222571]  ? do_user_addr_fault+0x1d2/0x8d0
[19282.222574]  ? irqentry_exit_to_user_mode+0x2e/0x270
[19282.222577]  ? irqentry_exit+0x43/0x50
[19282.222579]  ? exc_page_fault+0x90/0x1b0
[19282.222582]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[19282.222584] RIP: 0033:0x7f457651b175
[19282.222585] Code: 83 e2 40 75 50 89 f0 f7 d0 a9 00 00 41 00 74 45
80 3d de fe 0e 00 00 74 60 89 da 4c 89 e6 bf 9c ff ff ff b8 01 01 00
00 0f 05 <48> 3d 00 f0 ff ff 0f 87 7f 00 00 00 48 8b 55 b8 64 48 2b 14
25 28
[19282.222587] RSP: 002b:00007ffcfeee8d20 EFLAGS: 00000202 ORIG_RAX:
0000000000000101
[19282.222589] RAX: ffffffffffffffda RBX: 0000000000000941 RCX: 00007f45765=
1b175
[19282.222591] RDX: 0000000000000941 RSI: 00007ffcfeeea25e RDI: 00000000fff=
fff9c
[19282.222592] RBP: 00007ffcfeee8d90 R08: 0000000000000000 R09: 00000000000=
00000
[19282.222593] R10: 00000000000001b6 R11: 0000000000000202 R12: 00007ffcfee=
ea25e
[19282.222594] R13: 00007f4576603248 R14: 0000000000000000 R15: 00000000000=
00001
[19282.222597]  </TASK>
[19282.222598] ---[ end trace 0000000000000000 ]---

On Wed, Jul 9, 2025 at 11:17=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> I did some additional experiments with the scenarios we were
> discussing (eg.  "ls /mnt/ ; touch /mnt/newfile ; ls /mnt") and
> although your fix addresses the problem it seems more performance
> regressive than needed.   A smaller version of it that I tried worked
> fine.   See below (removes the apparently unneededd
> "close_cached_dir")
>
> diff --git a/fs/smb/client/dir.c b/fs/smb/client/dir.c
> index 1c6e5389c51f..fc5a2d7ec4f6 100644
> --- a/fs/smb/client/dir.c
> +++ b/fs/smb/client/dir.c
> @@ -190,6 +190,7 @@ static int cifs_do_create(struct inode *inode,
> struct dentry *direntry, unsigned
>         int disposition;
>         struct TCP_Server_Info *server =3D tcon->ses->server;
>         struct cifs_open_parms oparms;
> +       struct cached_fid *parent_cfid =3D NULL;
>         int rdwr_for_fscache =3D 0;
>         __le32 lease_flags =3D 0;
>
> @@ -313,10 +314,10 @@ static int cifs_do_create(struct inode *inode,
> struct dentry *direntry, unsigned
>         if (!tcon->unix_ext && (mode & S_IWUGO) =3D=3D 0)
>                 create_options |=3D CREATE_OPTION_READONLY;
>
> +
>  retry_open:
>         if (tcon->cfids && direntry->d_parent && server->dialect >=3D
> SMB30_PROT_ID) {
> -               struct cached_fid *parent_cfid;
> -
> +               parent_cfid =3D NULL;
>                 spin_lock(&tcon->cfids->cfid_list_lock);
>                 list_for_each_entry(parent_cfid, &tcon->cfids->entries, e=
ntry) {
>                         if (parent_cfid->dentry =3D=3D direntry->d_parent=
) {
> @@ -327,6 +328,7 @@ static int cifs_do_create(struct inode *inode,
> struct dentry *direntry, unsigned
>                                         memcpy(fid->parent_lease_key,
>                                                parent_cfid->fid.lease_key=
,
>                                                SMB2_LEASE_KEY_SIZE);
> +                                       parent_cfid->dirents.is_valid =3D=
 false;
>                                 }
>                                 break;
>                         }
> @@ -355,6 +357,10 @@ static int cifs_do_create(struct inode *inode,
> struct dentry *direntry, unsigned
>                 }
>                 goto out;
>         }
> +
> +       /* if (parent_cfid && !parent_cfid->dirents.is_valid)
> +               close_cached_dir(parent_cfid); */
> +
>         if (rdwr_for_fscache =3D=3D 2)
>                 cifs_invalidate_cache(inode, FSCACHE_INVAL_DIO_WRITE);
>
>
> I also noticed that this does relate to an xfstest (that should have
> caught it if we were running) generic/637 which seems to test exactly
> this scenario.  I will add generic/637 to our regression test
> ('buildbot', and have already added it for tests to Samba since it now
> has dir lease support) so we won't miss regressions like this in the
> future.
>
> Also another unrelated thing I noticed, probably server bug in Samba,
> was that the scenario   "ls /mnt ; (go to server) create file1 ; (go
> back to client) "ls /mnt"   was also not showing the new file (and
> clearly should have) due to Samba server not sending a lease break on
> local file creation - so Samba server has a directory lease bug (not
> hanging an inotify on the directory to note new files being added
> locally).
>
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

