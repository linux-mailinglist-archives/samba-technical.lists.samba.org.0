Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA5A1AE0E7
	for <lists+samba-technical@lfdr.de>; Fri, 17 Apr 2020 17:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=9D7RVQMXonZ/04NMPIVsBTqOqToJbnvL9baxwMLrqCA=; b=y308+mpVIyjSrG4NlE6GSus20E
	1zf8qANCFKnRiit1MBbO5hbDAJR/UrjUT87JzlNVC4WUy0rYrrWMuD/y7sgiL8BTI2VozEFxzwc8V
	HTlN5VdgH3HEBblL3z3Kp6TQiTmK1UlhssnB5+HW4S71gi82bdJ0iBVrtOgAQnPDs+Xo7/VTYbv2n
	JX9O7PoGLnclu7dDcA8payECprOg2zxak371DM2zsCjkPbWfPAxv9fFyKBOkSczmmpwVXapxZdpLQ
	UIPgqcBkpvBtrQu+wVdSbv/RzaeI1UESfUe1lfGz0yRFLUS91kFFSuEAb3V14KwFoenBcbup8ETls
	DSVc+DeQ==;
Received: from localhost ([::1]:37760 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jPSkm-00145m-Nb; Fri, 17 Apr 2020 15:18:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33252) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jPSkg-00145e-P3
 for samba-technical@lists.samba.org; Fri, 17 Apr 2020 15:18:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id v8so5177809wma.0
 for <samba-technical@lists.samba.org>; Fri, 17 Apr 2020 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:reply-to:to:date:mime-version
 :content-transfer-encoding;
 bh=9D7RVQMXonZ/04NMPIVsBTqOqToJbnvL9baxwMLrqCA=;
 b=DQVm/qlh7xFDalmsIPu9avZ5uxY4oTT9z/qCas4Nf7Lj6yTqOAwFjaPcOTigEW2JLK
 WwqTwrpw49ienQwsw45ZQY/HQz8bl1Aq2YEGgzFsy9CIppGWagAybjv5PpZ/u0te1KQL
 cfeXjF4uhXfw/SORAIl7wVtiT+ml0tqOvnxdneGoNrRQJ9pQNNAvHhG7xDeXCBb187XF
 qUnUF/6shvqyboC/NvmDTV3d7W/KiRxDsrOS6tGMK0pRGgpHpNUfY/+v7MRBQsJAdoKW
 YmPkxBYnAo+6sNtZqtXMeZT6uGOIcHO8CfKgXuyvjgTPwfipUWQnFkbncwtaasPUn51j
 Mpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:date
 :mime-version:content-transfer-encoding;
 bh=9D7RVQMXonZ/04NMPIVsBTqOqToJbnvL9baxwMLrqCA=;
 b=jdLu4Qquo6vboQ43HfCBslAxtWaRiafxvl9uI3FM2B8ySqPmI1KGb2EkRUdtIOMrWx
 daRA+lSrErwRsJH+Cfz4phB2IqjyQBQJYHboJ9ZPHj7YCYQLvdMGgsGILreKFkIuxKNf
 UfHIGkigtox5DqO3HHX4411ZdJH87SJOO/hBTK+QPJXs4Laad7kxYn+N794lz2nHQS/t
 FK0SEqtE4yROTtebpP+2s/fW6yYr4cc4aso5TR4q+0QVvBS/7H7CFC/4ifRMo/VZSbPk
 02dQyC0uDizKLKhleMd3cK/ucFAwSex8sn7gKFrK+9lY6q0wbatHQuYCFdkm9Gtt7eVJ
 pO9w==
X-Gm-Message-State: AGi0Puac4dayRQLZcndZ6yVl5Gdnogn9aiz4to51cflkw8rGcOWf5lyQ
 eZYcHc5/+XIeff8Ta2vPfpH6c5bj
X-Google-Smtp-Source: APiQypJ7zP9n0ztenoDheB8weLFIOHGg5i2Lf7Vu4FwFfdXURE9o45efaPOQfof0MKeCL6u9NwIKlA==
X-Received: by 2002:a7b:c5cb:: with SMTP id n11mr4135093wmk.160.1587136672219; 
 Fri, 17 Apr 2020 08:17:52 -0700 (PDT)
Received: from dakota.homenet.telecomitalia.it
 (host79-41-dynamic.54-82-r.retail.telecomitalia.it. [82.54.41.79])
 by smtp.googlemail.com with ESMTPSA id p3sm14157283wrx.82.2020.04.17.08.17.50
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 08:17:51 -0700 (PDT)
Message-ID: <accf84390fb0dfd9160359a802eb0d523fcca4c1.camel@gmail.com>
Subject: VPN Single SignOn with Samba AD
To: samba-technical@lists.samba.org
Date: Fri, 17 Apr 2020 17:17:50 +0200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Daniele Dario via samba-technical <samba-technical@lists.samba.org>
Reply-To: d.dario76@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi samba team,
these days of lockdown, I had to set up a VPN server to allow my colleagues to
work from home and I found really useful the page on your wiki so, again, thanks
to everyone for the great job you do.

My company LAN topology has 2 AD DCs + 1 domain member acting as file server + 1
domain member used to authenticate remote users logging in through SSH and now
IPSec VPN users. All machines are running samba 4.11.6.

Unfortunately the page "VPN Single SignOn with Samba AD" is not complete and I
found some troubles specially with libradiusclient-ng2 which on Ubuntu 18.04 has
been replaced by libradcli.

After some tries and searches I found that there's a ppp plugin that
authenticate against winbind and started wondering why it's not mentioned in the
wiki page.

With ppp winbind plugin I easily got a working xl2tpd server able to
authenticate using PAP.

In order to allow MS-CHAPv2 login, I found that it's needed to change the
default ntlm auth parameter in smb.conf to mschapv2-and-ntlmv2-only.

Questions:
   1. Is the use of ppp winbind plugin deprecated for some reason? (on wiki the
      proposed setup is with ppp radius plugin + freeradius)
   2. In the proposed setup with radius plugin, it's stated "Please note that if
      you installed the Samba4 on the Firewall server, then MS-CHAP/MS-CHAPv2
      authentication will not work". What does this mean?
   3. If I use ppp winbind plugin with PAP there's no need to change "ntlm auth"
      default value so I have the perception that this is preferable than CHAP or
      MS-CHAPv[1,2]. On the other hand I thougt [MS-]CHAP[vX] is better than PAP
      so: which is your advice?
   4. If I change "ntlm auth", do I have to change it on DCs and on domain member
      that runs winbind used to authenticate VPN logins or only on the latter? How
      much does this change(s) affect security? 

Thanks in advance for your help,
Daniele.


