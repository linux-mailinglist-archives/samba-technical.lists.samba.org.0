Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA6B5907EF
	for <lists+samba-technical@lfdr.de>; Thu, 11 Aug 2022 23:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=PYXTE58EuokZU+z2UHNf9Q+RbopgDavG6L73ydditw4=; b=ZbGquRJHzW+pzm58SiGTPF0EBs
	SA3+rtxY/ZroqhIaYOnzKT/ibKYVwdgASUSUG5/KctBZGXK9VkArCrPaWpSlVM3jL11/FQNmIjw6X
	Xuw8ABxq3b4c+azKojKFADqJ7SdQccPFfZk432Gb14C24Kr63wj6SvN8pYk8Lt7cQ5WKuzLp1lPz3
	l5TLKYFTOPm9FYPn/C+ZxoBzE75mIwVWFMvj2r4LQA7Wt0HT1+k+zHH+ifwjCrykMzJLtwbUvH6eW
	5WgB6EqCfrqgNRBdQYmVgXXuvp0bN1du17qVw2EzbBFis0IPjOdphOSsd1QyNBBJFmzsmJhmmLPOy
	rUAj2DWg==;
Received: from ip6-localhost ([::1]:57742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oMFWo-006xrz-9F; Thu, 11 Aug 2022 21:15:42 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170]:37471) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oMFWh-006xrm-UI; Thu, 11 Aug 2022 21:15:39 +0000
Received: by mail-qk1-f170.google.com with SMTP id v14so8901603qkf.4;
 Thu, 11 Aug 2022 14:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=PYXTE58EuokZU+z2UHNf9Q+RbopgDavG6L73ydditw4=;
 b=GD5CxqLyMm244m8ZZjxAiOZD3Hc5EdTtd8CLF17jgrgYzn5Yt8vL3TwxIoEkIZvm3N
 cAQCg9zmPJ1aD1ryu7sOnVkiNkltxqvVOMioj33EoyCIZoZNQFg9MJM3Fex1aAwoug6P
 ZFALZ4b4SFAnuimp8ZtK8ucQASKI8OyGM2zuLWtN8oJ/VvX1/ENYZXA77QbMQgzP3xPr
 rxP2SAM7tX8hD0SzY45/lMMjyat3CaOda3zaFvKOnx2xQxHrxDROGtUWmdjOtIBGYn7S
 eS7qrBAjHDZkBqakV7kHkQS2Jq99ROCzHk66G28keNUYnSkRtnsjz+yk3JRDdCBA9aXl
 c0FQ==
X-Gm-Message-State: ACgBeo0YkaIR8JMXamFUdJRBgphmjvpnMitzJBRULp+q+9ncV9/wgHQi
 CAUIw/tGlzr3TZW6uBNGWTjZn481tvnlE7X58Q==
X-Google-Smtp-Source: AA6agR4ePdidHDEOrpbJHnrPgIJip/gYVbD3Yqt5nkuBLsKXKH2vXcyVkBbKs7NxdzWbNWNPgb1GBbfHygD5OJbgQdQ=
X-Received: by 2002:a05:620a:2589:b0:6ab:91fd:3f7 with SMTP id
 x9-20020a05620a258900b006ab91fd03f7mr760273qko.104.1660252525388; Thu, 11 Aug
 2022 14:15:25 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 11 Aug 2022 14:15:14 -0700
Message-ID: <CAKywueTujSTFAv5B=o2t6zjNdyVdVV6PaYQov-XR7duYXrs5tA@mail.gmail.com>
Subject: [ANNOUNCE] cifs-utils release 7.0 ready for download
To: linux-cifs <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>, samba@lists.samba.org, 
 Steve French <smfrench@gmail.com>, Jacob Shivers <jshivers@redhat.com>, 
 Alexander Bokovoy <ab@samba.org>, Michael Weiser <michael.weiser@atos.net>, 
 Ronnie Sahlberg <lsahlber@redhat.com>, atheik <atteh.mailbox@gmail.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <pshilovsky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

New version 7.0 of cifs-utils has been released today.

It brings GSS-Proxy support which when configured allows unattended
access to shares (e.g. from batch jobs).

Links

webpage: https://wiki.samba.org/index.php/LinuxCIFS_utils
tarball: https://download.samba.org/pub/linux-cifs/cifs-utils/
git: git://git.samba.org/cifs-utils.git
gitweb: http://git.samba.org/?p=cifs-utils.git;a=summary

Detailed list of changes since 6.15 was released:

3165220 cifs-utils: bump version to 7.0
7b91873 cifs-utils: don't return uninitialized value in cifs_gss_get_req
d9f5447 cifs-utils: make GSSAPI usage compatible with Heimdal
5e5aa50 cifs-utils: work around missing krb5_free_string in Heimdal
dc60353 fix warnings for -Waddress-of-packed-member
c4c94ad setcifsacl: fix memory allocation for struct cifs_ace
4ad2c50 setcifsacl: fix comparison of actions reported by covscan
9b074db cifs.upcall: remove unused variable and fix syslog message
2981686 cifs.upcall: Switch to RFC principal type naming
8a288d6 man-pages: Update cifs.upcall to mention GSS_USE_PROXY
aeee690 cifs.upcall: fix compiler warning
e2430c0 cifs.upcall: add gssproxy support

Thanks to everyone who contributed to the release!

Best regards,
Pavel Shilovsky

