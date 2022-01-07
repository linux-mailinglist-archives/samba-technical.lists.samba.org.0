Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 701CF487E07
	for <lists+samba-technical@lfdr.de>; Fri,  7 Jan 2022 22:09:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=vKxoMTS/D3yEZNYxS4o55LLk6q39y2nCegoNuH2Idps=; b=pldmU/sVuV1bCyBV27Lo0EVN/n
	MSppamLe01fDvl/PP5kddBXpCPTQ4I9KJL8Ck98kNTr/rlGsshl8Nf74xuzbrM/ycwDdMKroEqTAT
	fnOlqZTG/A8ejyyarl2K4y3pBySiJbSBlNE4WVo178c8i+P2EG084OrMX+9w/Upk3izCawP21qM+G
	XpE5Z/675vzOAW0y1EEyr3T2dtNxWvdDolI2sy+GdNdZy8SBDPhNU1jDuO0REaXavHIWJMGLMY/VP
	UajbFc7anEUv3yZN/QWYvhuST97cCd9jgtscY+mPTuSJxk9syK5noI+Oo2QoFFgc/Sb4nw4Yey1un
	bSQYCtbg==;
Received: from ip6-localhost ([::1]:24934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n5wTm-005nwf-DU; Fri, 07 Jan 2022 21:08:54 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:45009) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n5wTh-005nwW-Lw
 for samba-technical@lists.samba.org; Fri, 07 Jan 2022 21:08:51 +0000
Received: by mail-lf1-x12b.google.com with SMTP id g26so19900070lfv.11
 for <samba-technical@lists.samba.org>; Fri, 07 Jan 2022 13:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=vKxoMTS/D3yEZNYxS4o55LLk6q39y2nCegoNuH2Idps=;
 b=TCEhMPWhFBuANZQXoh80Dou4Lq91/vvoUWiYlIRL8EFU/NUmL1w+KWlkSqphL+kc0T
 DdiLdzN/ApGNLha1isu9yo6RZHyacJ2k2P+niu0t1AT+/ghAzOmtjhxKynbTXyE7+5Xv
 uaacWaLBMz7yafAkGbm7OI8broIHKXZMTtjyJgEnb/gH9s6Rl+Y32VsoFeVX6h2cjcAD
 jPNTqrD+1I5q/YdVCi7fUzqrTd8b764rSGZHVbjwqaIGnePL5lpLFEwl1jKFajkWJOCS
 1aW4KY67dob8DBjRJfF9oQ7Mu02TEVrgxZv2z6IsRwNk9/TPse2cCunLuDkd/c28gses
 +OyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vKxoMTS/D3yEZNYxS4o55LLk6q39y2nCegoNuH2Idps=;
 b=Of3izVgH+P97ZuNMf8gMqLlqIN6i/KxRl7IRYGMl57khQvCMr17aGKHHuiHkfvsrt5
 MF0pHaPOMjcr/E/TDC4S6bJYPZaU7sjxu5hrQE7KN3HCgu5E1b22ZyM8RL6tMSgG8YWC
 l/TXB0H6u59tlwDa+FOZ163WGqxyhcfsayG6pU0HPIQeYMG1c14KWN9mSBuXafA8Dvhr
 fXfJ4Aqw2CAhdhZ9bGqMRSQBoSnzTKxNK+s3z2C/du61JKvRf0qAVDBzm0QJS9WqEIBx
 s+9eRzcVgT5cgdQ7Ml3nSiW+0PmyOYa56SZw1Wr/XlkUuddzMFoEQUpRyP8pJTRq9D/8
 jG1A==
X-Gm-Message-State: AOAM530E5eltq1rSx0py5jmqAoiXynmZNVVShhecfeMlot25IBryRc0X
 fEcRoWDglHtczWQpEDb+BqlVBFO6jDall20TPdpHNHnT
X-Google-Smtp-Source: ABdhPJyxGsK1R9JnMP4qvmHgqqEo/FoUnmyjoUbU21z0Kt3LB4HELOxptl3Pnx8nxfy0zT4d3OpAOQQFCZgOvcizUKY=
X-Received: by 2002:a2e:a26d:: with SMTP id k13mr52600158ljm.229.1641589727897; 
 Fri, 07 Jan 2022 13:08:47 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 7 Jan 2022 15:08:36 -0600
Message-ID: <CAH2r5mspLap2Fz=ZrMd2q3q2qikL=qYJOFa_G-THUyJph+f=yQ@mail.gmail.com>
Subject: FreeBSD SMB3 client
To: samba-technical <samba-technical@lists.samba.org>
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

Do you know the most common FreeBSD SMB3 client that we see mounting
to Samba?  It is confusing looking at their man pages (e.g. "man
mount_smbfs") because they refer to the "ports" collection for the
SMB3 client but with no details in the man page they refer you to

-- 
Thanks,

Steve

