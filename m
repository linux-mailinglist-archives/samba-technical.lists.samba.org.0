Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F5DC7366F
	for <lists+samba-technical@lfdr.de>; Thu, 20 Nov 2025 11:12:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=sBIbpy1Fif72LZQwlorDnGPhD1ipsN5eOzIr1zNflKI=; b=EMAAM+CG5gcFcIRa8R9xtKbH/b
	RUkGbKuuD7JKBHfO13hMSj5XJk3mGqIOAqI05QWtcRCHiinEwZC/e4uD7j6QQnsNFgiWL0f6nGXPA
	qaxRGaHjUhpOvcFQjBCaAjhj9MLlw5SKnbeCJVmcml5M1LonoEWzHCS/Si+btz/8Mj3rnQtj7j2MH
	UrdefvZNDx7J3e2kajzjKIl0xNE7HvsKwzXhKjChqWfg4O8yliwGV5xcdoNm/ZhzMt4+9Ttw10cwj
	mQ4lqalc15ME7zGLXWEhu2ZTV5GLThomQRrjQLJIMklKW75qyq4yz//EU8h7av/dLA/MtmzRCxs/N
	jJ+hiCzA==;
Received: from ip6-localhost ([::1]:29494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vM1e7-00Cj0y-Qm; Thu, 20 Nov 2025 10:12:11 +0000
Received: from fw2.atmos.eu ([31.41.205.71]:51096) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vM1e3-00Cj0r-ME
 for samba-technical@lists.samba.org; Thu, 20 Nov 2025 10:12:10 +0000
Received: from localhost (localhost [127.0.0.1])
 by fw2.atmos.eu (Postfix) with ESMTP id 1BBD1E00EC
 for <samba-technical@lists.samba.org>; Thu, 20 Nov 2025 11:12:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmos.eu; h=
 organization:content-language:subject:subject:from:from
 :user-agent:mime-version:date:date:message-id:content-type
 :content-type:received:received; s=20180430; t=1763633523; x=
 1765447924; bh=0kEezyseRrP2oWdXjFZW2zT2ii7E8PGyPlzBZkaqboQ=; b=r
 uF4EoVOvWmAFb9fVtc/8T45NQwvzbDUQnbM3xN0N3TtfmOEBMGk3GmCl/l/e6yPr
 RHpHb5I+YOXEyGe8nWaqDteZTYI5hzTSn6UZazr1wz1KJXpyHnyQfFIZGQcq0Uv8
 GyosgQG39x0XK0PsJH9bpTa3o8LRGcRPLryzbeUi+OS+Ec0tziiD/avA8pOfXML1
 yB6eRtToUPvy+on3MhdXpYoy4j0yZOGMRb8kDhPfYOL5yALwVyyaNJkBPrCucYJP
 3nCjoOHrNFG3A0B7ijYqbSavho1xyZ85oSnDXREHIMRPs2te/PEN7Slj/Gt6PwSA
 C8wxYnbJc/ntit/Gt2qBg==
Received: from fw2.atmos.eu ([127.0.0.1])
 by localhost (fw2.atmos.eu [127.0.0.1]) (amavis, port 10023) with LMTP
 id hADGfc1_HdWZ for <samba-technical@lists.samba.org>;
 Thu, 20 Nov 2025 11:12:03 +0100 (CET)
Received: from [10.50.20.4] (unknown [10.50.20.4])
 by fw2.atmos.eu (Postfix) with ESMTP id 3FE79E047F
 for <samba-technical@lists.samba.org>; Thu, 20 Nov 2025 11:12:03 +0100 (CET)
Message-ID: <249dd6a5-ca7e-453c-8c62-af1239cc6d08@atmos.eu>
Date: Thu, 20 Nov 2025 11:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Breaking changes in CIFS kernel module from 6.12 to 6.16
To: samba-technical@lists.samba.org
Content-Language: en-US
Organization: =?UTF-8?Q?Jaroslav_Canka=C5=99_a_syn_ATMOS?=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Peter Milesson via samba-technical <samba-technical@lists.samba.org>
Reply-To: Peter Milesson <miles@atmos.eu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

OS: Debian 13
Kernel: current 6.16.3 from Trixie backports, previous kernel 6.12.48 
from Trixie security updates

I got the advice to post my problem here by Rowland Penny from 
samba-users list.

I'm using CIFS to mount user home directories on terminals through 
pam-mount. After successful authentication with display manager LightDM, 
the user's home directory is mounted to /home/<user>. The window manager 
is LXDE, and it's creating sockets under ~/.ssh/agent.

This was working with the previous kernel 6.12.48.

After installation of kernel 6.16.3, the window manager terminated 
unexpectedly, just before displaying the desktop environment. I tracked 
down the problem, and it seems creating sockets on the mounted share is 
no longer permitted.

The CIFS mount parameters are:

    dir_mode=0700,nosuid,nodev,sec=krb5i,cruid=%(USERUID),mfsymlinks,nobrl,vers=3.1.1

When I changed the mount parameters to:

    dir_mode=0700,nosuid,nodev,sec=krb5i,cruid=%(USERUID),sfu,nobrl,vers=3.1.1

everything seemed to work as before.

Is the change in behavior of mfsymlinks intentional or is it a bug? If 
it is intentional, is using the sfu parameter as a replacement a valid 
alternative?

Best regards,

Peter Milesson
