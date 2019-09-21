Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FA0B9D30
	for <lists+samba-technical@lfdr.de>; Sat, 21 Sep 2019 11:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=udbQo3HwW3wvcBCXw3BLsLO1iikSmqxQh+yfiLe552g=; b=J+mAwujUN3G4yBoiWvzSqvsCbZ
	cwDolpPMemX/EElSMiLFtOMxjmJfwWnWF/SxdVdPoD8wHd09opvvvmuMEa+vJn1Im31cAhQ3C1pFj
	+cmoD3VlmFiGaU8i/lst+C5kZOsJHXKz2EUGzLGc6NCpDB/8M5v+wkKAYMO0q1KWzsFysR4zSTctO
	GQ78hpNnXfRcGh5Bc+yrMgbtEuCe6+aELFt7uIoivpNercz5XUdn4351PWPMtNMYy7/u/Q+ICVgKa
	7KQNHwhTcJAOn73PGHnTyHUHEO6wsixxwWPZY6GGyOZCTR+n+r324UNWOpFwfv6ng/ZrRtPRkmJI2
	VkI1qwSw==;
Received: from localhost ([::1]:63188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iBbwU-007Odv-7c; Sat, 21 Sep 2019 09:44:38 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:45180) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iBbwP-007Odo-4w
 for samba-technical@lists.samba.org; Sat, 21 Sep 2019 09:44:35 +0000
Received: by mail-io1-xd2f.google.com with SMTP id f12so21734990iog.12
 for <samba-technical@lists.samba.org>; Sat, 21 Sep 2019 02:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=udbQo3HwW3wvcBCXw3BLsLO1iikSmqxQh+yfiLe552g=;
 b=AW01f4lKePxU2m8hK9jM25qstyaQCNNP60OQnos9prG/ZODYWfskoC2dlmXv9alsw3
 cWZicj83VRFbkWmHeBJkdBL16aQQ/NinVcGiWPkliHyi5WCeQJaxPx8sE6LyAza6ro4Q
 QmCbKV5R+dhqz2M9wPrN3UkvSwy1ggvfgu6Ro40Rp+M5fQnEfx0ELdJ9PS0YrN+zrzuK
 ckhqOWI5CWmjwLvz+gGfaw6H21+yTkvxNi6Awt4Ijr7Qe8J6okWGWG7XUdYGeQB0AKWu
 mPXA1Rpq1tSOXakyhIQsRZYuXcZTEdRCWA4FfGhjeTgnTq9o/QDtELru3GZU13s2IqLD
 DtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=udbQo3HwW3wvcBCXw3BLsLO1iikSmqxQh+yfiLe552g=;
 b=FyZsn5wkYMxEzBMSZVCCZBTUqIrTBwXrV6cO5lc5vLxvcqII6uExD+flk1gyo+4sz9
 QxAg49GZiKuMIFmEzk6IXzFTcrQR6vzc/ngRRH9HVyU/ww71CjyxFpTei/I8SEpyYB4/
 xKSVjrJN/cciktN7MqftFJlopRSaPtzeZW0vWQUKKefWIW8ovxklXk/D8IJzpgIjFDFV
 sWVOM6HW43+oiU6QvfnJLNmpG27VZ2/yd0ljdS1xojQkOTMMC2LogXssMSPdStSIrqGZ
 /bBlABcOsf2jy8/XNU+LhTzHkNjeCBrUOYMgClXRBIS8Yp3FeL1SIC+OSNHL0ReHPYxa
 Exhg==
X-Gm-Message-State: APjAAAV1nWHgOTHqfBTQhsbe8v2w8TwXzcfgVNZxv1mpPAXSVThn8LbG
 SRL/ChhUafRhhRISVG07HeawFty3sHmy6EZV5Zc=
X-Google-Smtp-Source: APXvYqw2jcTj3DzQAaJiW66hWG1iMWy6QRNgrl9XaJWDBVRKiZFGlnF+ZEqbbSh6oQnylbwsQeKN3YXp0CebL0PpUFY=
X-Received: by 2002:a5d:8e0d:: with SMTP id e13mr12089725iod.3.1569059071088; 
 Sat, 21 Sep 2019 02:44:31 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 21 Sep 2019 02:44:20 -0700
Message-ID: <CAH2r5mui+2q-DNW9a7-prRWt82ZLCc9hLBNsSQxNdVa=Go1QEg@mail.gmail.com>
Subject: WSL and remapping of reserved characters to Unicode remap range
To: Edgar Olougouna <edgaro@microsoft.com>, Jeremy Allison <jra@samba.org>, 
 Pavel Shilovsky <piastryyy@gmail.com>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>, 
 ronnie sahlberg <ronniesahlberg@gmail.com>, CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Did some experiments today with files created by the Windows Subsystem
for Linux and noticed that they create files which have reserved
characters by using the SFU remap strategy not the default used by
Macs and Linux (the posix or "SFM" mapping)

But at least it means if you mount to a windows system which has run
the Windows Linux Subsystem you can simply do mount with mount option
"mapchars" and the file names should show up fine.

See example below (mounted to Windows directory created by WSL):

Virtual-Machine:~# ls /mnt/special-file-names
'dirwithtrailingspace '   filewith:colon         'filewith space'
'filewith*asterisk'      'filewith>greaterthan'   filewithtrailing.
 filewithbackslash       'filewith<lessthan'

--
Thanks,

Steve

