Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0753EBDB4
	for <lists+samba-technical@lfdr.de>; Fri, 13 Aug 2021 23:00:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=N9AYQ1bcv6fs8gabzA6ySzhjvPgvMwHk8Zm0ImnpTjg=; b=YH/NA7lwYn/7mKGghj+elQfRKh
	/HhTBi/HHB6Ff5U+lcTYjQ4NJCWzDvZMyVQP1IVtxJmxdtB4W/xo24yncSBRMc451uLMHauiYLPzJ
	sqF9HS8D1ag8+Ud9ByNX5XaN7ff8Uz6nUPk3jaiMFr6nkPOLPJ+37nFsZBgnp/k/JBV0UT3ylBy4A
	XTu88V0AxxZQgtpxrUjagTjdjoiHCF5RKjgHt1nRBVwlKKVRkIkfvyVfle30BpSmmqwP3fmxp1+J3
	1VgwgTillWvjuHFgeeRbnu+waeUeclsqU0vZEEMp/U8iY0LsRU1KywPkT1lGQlW897iZMi18Gs+3X
	ZqDFl9sw==;
Received: from ip6-localhost ([::1]:30342 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mEeH6-0063DI-S4; Fri, 13 Aug 2021 20:59:32 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:39650) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mEeH1-0063D9-R6
 for samba-technical@lists.samba.org; Fri, 13 Aug 2021 20:59:30 +0000
Received: by mail-il1-x135.google.com with SMTP id y3so12194436ilm.6
 for <samba-technical@lists.samba.org>; Fri, 13 Aug 2021 13:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Tsm1gQ5gvs1mf8ddy2CciqKBkX14ZuhXv6hi4yxpw3o=;
 b=gJaCa0Om5VL01jqqd/27lQ7OIqyrQjnG06NV/QXq+qRYVzjJHKb9sBBpi5gbjlcT9T
 40+IlAMZCFh5XuplA2SdhI6/5HSQZbLhJdI5fWCxjQ6xKEGCctaeGChWXUgv+xY+oq9/
 n86LHsc6LHf4QFcxi5asCYuyfTw0lov9GXsgAyBQlbFtNzIVqBT9hOZ0C5HGHgbdNki7
 Nlz99XJuXRMd5yX0ZOO3ppWc1ylOi7PLkIYQC+R0XvBy5lOZcpvrHBdiKH/Cp1VXE4tz
 FXcC5HVWZK1yLmcYk4pVwR4QhTHgKvF5CvZ5nUwLmDngzq2uyL6SWLv3KGcaoL/RkSGc
 CV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Tsm1gQ5gvs1mf8ddy2CciqKBkX14ZuhXv6hi4yxpw3o=;
 b=WhySUA/rdO+StMv1Wqmogp3nJkT+eLrpbJnMVT/aqgYg7CTc9XtoJpVTsssiUoe2xF
 otXiC1J1m6GIwG/mna171rqqmteCS5h4ehCYMVu9w5eOyJV4zSHLndxK/74EuHSXqYUG
 Ktv5BUidgcPixH12WPtEtLLFwfdo29GSxXB0HsUKxbI8jVAsceNO7VBHfcpjedUsoBBe
 LMthF26RniIt5Qx24sKD0gm9GUIe4Gwd/Q3w98VGsjfKHDA7MvtuWoCnvMORe3+Vzxhc
 mEFd3hdK/80ftNe0yOHcIm080899VlN1TTNutCD3cJcpJ3r92T/XAm0fdnQ2PDhNKSGI
 ctkA==
X-Gm-Message-State: AOAM530EBRZNZYS7gdnC2bOsQcqhX4RW9rtse0YsMhhjcUEFEJctac/Q
 q0s+5OH8suSZ2tlWTTZGsCEGc9zVpBouX+rxLq6oEHKRTnU=
X-Google-Smtp-Source: ABdhPJwi3F7Inn8j3cN8EXUrQf2bO+OWsieSIWvnpgBF0yvPCJjhUWS8bGjPGuuesdqouE39vxjoOqFXmEY4q+CSH1Y=
X-Received: by 2002:a92:9502:: with SMTP id y2mr494947ilh.170.1628888364963;
 Fri, 13 Aug 2021 13:59:24 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 13 Aug 2021 23:59:14 +0300
Message-ID: <CAG9bPH1L4Lof-oA1Wv-S5S17fTucBcC-m_LQRfC3wayjoDq4TA@mail.gmail.com>
Subject: SMB Multichannel on Linux client, again...
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Dmitry Martyanov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dmitry Martyanov <dmitry.martyanov008@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,
I am sorry for disturbing you...
But I still couldn't make SMB Multichannel work on my PC.
My hardware:
1. PC, which has 2 NICs, works on Manjaro KDE (Arch Linux based), 5.13.8-1
Linux core.
2. NAS, which has NIC with 2 ports, works on OMV 5 (Debian based), 5.10.0-0
Linux core.
On the NAS side I edited smb.conf as needed.

If I use Windows 10 on my PC, SMB multichannel works perfectly.
But on any Linux distro it doesn't work at all.
From /etc/fstab/ that I use for mount folder from NAS to PC:
//192.168.1.2/Downloads         /home/user/Downloads      cifs
   uid=0,username=user,password=pass,user,iocharset=utf8,vers=3.11,multichannel,max_channels=2,noperm
0 0
Are there any mistakes?
Maybe I missed something in or...?
And I know, this feature is experimental at this time, but in win10 it
works out-of-the-box without any additional settings needed.

I hope you can help me or maybe find a way to solve this problem.
From my way I promise any assistance for it.

Best regards
Dmitry
