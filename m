Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A2BAAA205
	for <lists+samba-technical@lfdr.de>; Tue,  6 May 2025 00:53:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=jXd13H2EdCERZWZDbvrMkvvA3idPtu6B2YQxarAKvzQ=; b=Pzjjcff2ga6y+oQDzUEKu2Ucp1
	VGf4WgABMgESPblloMceXyiR0e7JTXh50JPv71lnWeqkNLV9jzl+ER8QoUBz9PlE8PdSjt7Vn+L4S
	isBdy2VpuLBgBhCAsJQKzCY7/rC6uXrCIbcjcU9CHKe014SwFSIbSVCsUs5SBJm0dlOB10DdC3N0W
	ciorYKpK5nEF4iQ2CNrPnEDoit8JVbgOroyOyx+4nU3K07rrLQ+7wTMtTUUul/ZTYkjlTIf01Jhd8
	N9TFJ7eBTEED/WpNP+CJKrmUurry7YCzFaMGhdqnaltMvbhicuMmG9qgCrNvl7mPIzkMcRx1ge4OI
	T6+AOmfw==;
Received: from ip6-localhost ([::1]:23420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uC4gW-0038np-CD; Mon, 05 May 2025 22:53:16 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39512) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uC4gQ-0038ni-8E
 for samba-technical@lists.samba.org; Mon, 05 May 2025 22:53:15 +0000
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0009B3F470
 for <samba-technical@lists.samba.org>; Mon,  5 May 2025 22:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1746485585;
 bh=jXd13H2EdCERZWZDbvrMkvvA3idPtu6B2YQxarAKvzQ=;
 h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
 b=eYxI8+ZdkvTEHnFOLUd/4epaRhFAVDAYUT+6RKFVngXyCe8pSwRNwgVYYjwVb+tKr
 Cg7WB1If6/DPH+eDw912HOD1+XhBSq8K/fSyaZ2qJ5pZD/ztlGnbQLPpr9gymk3m1Z
 zzp+oqTQHEHoLCmfox1SOnAMws2c/YP7bfGFOktWbrMy+9rwVlelRCfr++NxxGaEp7
 KQ7YjE86zTeV7Pl0033oTOZk0/ZCEgC/WwmDrRZ/yoTlwkTrFkTt+iow4XSh4oCWhF
 W0XP2HZx9hlNeerJ0fGARE2iZFtaVPL1XeA3CXgTO0w3fk142ZU/tBvxprp0gUKKqm
 rYfmYLec8TcHw==
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-7080c0fe7b5so70819057b3.2
 for <samba-technical@lists.samba.org>; Mon, 05 May 2025 15:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746485582; x=1747090382;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jXd13H2EdCERZWZDbvrMkvvA3idPtu6B2YQxarAKvzQ=;
 b=C8it51IAJIvYPmnkhxUuvJ9UQaWMeyQ9fewYWUudCGPCzKofLhi64oAvHOAgNP2fDM
 k1dnqQd/ucvWwXDmXWoFl6O6sCaKRzvXemAc3OolfyWQaoR1leoe3VxsyB5GHTEs2Djh
 9HIiJFKiHLBdRGR+QgKLeg/0zEC/jQsM43Pm2DK4XiwuM6wSkSGt9ybcTPfOTL/QQlEj
 JK+6DkjTzyG030gDR2B6yb9BVLUdKF3Q2rDbIzLi8r1BdkgZBaKBBPJiP0poJk5c9ce1
 w9CWKwTxzzkX6tpF04NQN1lRjunVknzcxh1LqemopUsO7LSOJwvGEsjeyrHlXSsHi0h3
 chGg==
X-Gm-Message-State: AOJu0YyzE8Acrr61ab92jFH6UOJTze8aolEMke9XYqYRW1OwBkyObUwR
 9ZA7y8aoEE0qHuL+e62X/ZWbFWLqM2gmrd1y4JJvAGd6JIe7TwNe3ej93P5bzgVNOhwE7U6450I
 W1hB0MS7SXh0+AGsiBdi5h7rfjHPKfbUgBkaKgbeL/YqVDpLaFcadZK2GzQ/iWb/DCFzwOenI58
 7AATScA8jeGSy04eaCQZLEMq2TFPhTEikK1xEJ8ZDPfi+RzWdI//EZ2PSgLFR24Kp8jZysEg==
X-Gm-Gg: ASbGncv4I/dLFqAMyTTl6H2S02NgLZsfWpRxIx+LvoY4c7raXTG2iVLHymZaurS8a8a
 wgbMw40n5/pdFT1KjLFbjIvzBIt6etSNiEDtqAMxDa9MoN2eYUeIm5g7gh9ZW45Y4SapV
X-Received: by 2002:a05:690c:3687:b0:708:b7fd:bb03 with SMTP id
 00721157ae682-708eaee1e53mr126730567b3.13.1746485581852; 
 Mon, 05 May 2025 15:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz1ESPHkFao8bJezPcetsiPNuyfKwsGi+wVkqy2XyvU7GBtwHRfWOjTobRQ5wsBg7PMsKeYngRyi8yqN97WNs=
X-Received: by 2002:a05:690c:3687:b0:708:b7fd:bb03 with SMTP id
 00721157ae682-708eaee1e53mr126730367b3.13.1746485581507; Mon, 05 May 2025
 15:53:01 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 5 May 2025 19:52:50 -0300
X-Gm-Features: ATxdqUGT6BJ2BQjMPVT9_TIPm87xWuhFI3tcyvLfyCN9j7HXMZkQ5iKwlLbGbgY
Message-ID: <CANYNYEGAcAcp-T6BMVCaXWfw5PV-x2UJ8UbGOGx9=YpXsz1MSA@mail.gmail.com>
Subject: samba-tool gpo manage motd set failing with invalid handle on s390x
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Andreas Hasenack via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Hasenack <andreas.hasenack@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I just wrote some tests around the motd GPO subset of commands of
samba-tool, and am baffled at a failure I'm getting only on s390x (big
endian).

On a freshly provisioned AD/DC controller, samba 4.21.4, I run this
command, and it fails:

# samba-tool gpo manage motd set
"{31B2F340-016D-11D2-945F-00C04FB984F9}" hello-there  -U Administrator
Password for [EXAMPLE.FAKE\Administrator]:
ERROR(runtime): uncaught exception - (3221225480, 'An invalid HANDLE
was specified.')
  File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", line
353, in _run
    return self.run(*args, **kwargs)
           ~~~~~~~~^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py", line 3850, in run
    reg.increment_gpt_ini(machine_changed=True)
    ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/samba/policies.py", line 198,
in increment_gpt_ini
    self.__save_file(self.pol_dir % '', GPT_INI,
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                     out_data.read().encode('utf-8'))
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/samba/policies.py", line 99, in
__save_file
    self.conn.set_acl(file_name, self.fs_sd)
    ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/samba/samba3/libsmb_samba_internal.py",
line 128, in set_acl
    self.set_sd(fnum, sd, sinfo)
    ~~~~~~~~~~~^^^^^^^^^^^^^^^^^

I bumped the logs to 10, but didn't spot anything obvious. The motd
text is set correctly in the manifest:
# cat /var/lib/samba/sysvol/example/Policies/\{31B2F340-016D-11D2-945F-00C04FB984F9\}/MACHINE/VGP/VTLA/Unix/MOTD/manifest.xml
;echo
<?xml version='1.0' encoding='UTF-8'?>
<vgppolicy><policysetting><version>1</version><name>Text
File</name><description>Represents a Generic Text
File</description><apply_mode>replace</apply_mode><data><filename>motd</filename><text>hello-there</text></data></policysetting></vgppolicy>

The manifest.xml file does get posix acls, if that matters:
# getfacl /var/lib/samba/sysvol/example/Policies/\{31B2F340-016D-11D2-945F-00C04FB984F9\}/MACHINE/VGP/VTLA/Unix/MOTD/manifest.xml
getfacl: Removing leading '/' from absolute path names
# file: var/lib/samba/sysvol/example/Policies/{31B2F340-016D-11D2-945F-00C04FB984F9}/MACHINE/VGP/VTLA/Unix/MOTD/manifest.xml
# owner: BUILTIN\\administrators
# group: users
user::rwx
user:root:rwx                   #effective:r--
user:BUILTIN\\administrators:rwx        #effective:r--
user:BUILTIN\\server\040operators:r-x   #effective:r--
user:NT\040Authority\\system:rwx        #effective:r--
user:NT\040Authority\\authenticated\040users:r-x        #effective:r--
group::---
group:BUILTIN\\administrators:rwx       #effective:r--
group:BUILTIN\\server\040operators:r-x  #effective:r--
group:NT\040Authority\\system:rwx       #effective:r--
group:NT\040Authority\\authenticated\040users:r-x       #effective:r--
mask::r--
other::---

Here I'm just interested in exercising the samba-tool gpo motd
commands, which got a few fixes recently. This check passes in many
other architectures (arm64, armhf, ppcel64), just not s390x.

