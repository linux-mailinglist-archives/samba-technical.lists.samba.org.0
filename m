Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A750030
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jun 2019 05:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=3lQoXJ1dymJIS6Y/FsyTEm2UVd7fXkrqHDzZRX1Rv60=; b=vvuaXQ2cOMU5a86YzL0fzQovy6
	U5XRl+ZW2wCpw+aFc9XLPd7Odm3MDO1F2lyrD7l36N7dj5PaBrD0tsoat/tcqYrY8KjkCwROS0U+L
	BtkVuUKsJeK3iQV1380PQeeMFy4yljz/b1AbOs+qDwDNo36hGm7b7UPy4IHqlfxqYLbQ2++gQCcsO
	QQRYnA6ItLb8XZiivy2L6fHVe4PlRVTLiMlvuVLktz2IuGk7GFK3VOAEDboxBeT6dmysyJY0lHHxC
	PUxsQGblMNfowplIlLlIjI3N16fM9kCeIZZIfF3OQsgDPMVFe882FM5E+4o93ItCyirGq9QLykhU7
	aFPcGDig==;
Received: from localhost ([::1]:63824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfFZO-001LZq-68; Mon, 24 Jun 2019 03:23:02 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45288) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfFZJ-001LZj-Vd
 for samba-technical@lists.samba.org; Mon, 24 Jun 2019 03:23:00 +0000
Received: by mail-pf1-x42f.google.com with SMTP id r1so6651392pfq.12
 for <samba-technical@lists.samba.org>; Sun, 23 Jun 2019 20:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3lQoXJ1dymJIS6Y/FsyTEm2UVd7fXkrqHDzZRX1Rv60=;
 b=S8KUfqKQMkHor2arXMcbkxcoIxFB3ToewWpVaZzvCNeJlXcLTpzbT1nlJkFoKO2f5Q
 P3B6dkRpKb/TiO3f2PBAVohE7TJj6/QHfCHCBtfu/SWVj//vFhuwd27uNB9+XmnRVgAM
 9tjRy8QZC1h59160ttUcVqHvXR9KHWWr+lppHTNEegGHpxqTwbckb23RQWtfsLlkTDee
 G/6/a3cXS7kJiF+ER8e7xGdtOwINA7VCZhRYPiAsF9R3OPf2vtjpE3fVmF40iSwbfRV+
 Vn30t8RTXuh283L2I3ARNpE7tIKYwYBz8QFM3YcEz2/D5xy0oWVX4L0mfAJO8OTVBI0A
 yt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3lQoXJ1dymJIS6Y/FsyTEm2UVd7fXkrqHDzZRX1Rv60=;
 b=c1kO1jN+AgdYv5VopqaA2z7aJPgVRbQ8WUOQ7CPyXRb6vkKpX0GewPXQ7gXbytvOu3
 lnBm1kgK0nDhl2w7c3zQBKs9bnISvN3zJE6WNizgfqt/muO4rsvb78ITqE/G9HIHbz8P
 BmuDowFTouAeWsFvtXSZq5JRVDeouhdc3HQDRos/fY+56gUquPFxjIPeDvi36KJQwnvB
 41Oxn+WfeRkXp/nNXgNn9gMzJoehPtypJNKyxkpk9hxU6W0TjYsnRjoyoVtAGfouMvDc
 vXxk/hP6o0YlDUIneYnkDBKtB98d9pXUKf1lCvsxFiYHijNi/ayXXMXx5lmiirh3P1jW
 EbHQ==
X-Gm-Message-State: APjAAAXV+6MBf52XyL/D86xYz0XpFJUOIrx7ExYYwWubKEwL/CAOSACr
 h96BicvLmYlf5MbTFgm08RtI+aMLcTK4w0T5h+1kaLwR
X-Google-Smtp-Source: APXvYqyS4j3doQw4LGxfPJZzgFSkahgRxCPV+SvHbFoybnlz1Fq5vas82BPI0x65UNx9Gz4aYq/Lmb+1EuyumsjHMbw=
X-Received: by 2002:a63:81c6:: with SMTP id t189mr18456341pgd.15.1561346574585; 
 Sun, 23 Jun 2019 20:22:54 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 23 Jun 2019 22:22:43 -0500
Message-ID: <CAH2r5mv+oqGxZRkV_ROqdauNW0CYJ7X9uJCk+uYmercJ4De41w@mail.gmail.com>
Subject: xfstest 531 and unlink of open file
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
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

Xioli created a fairly simple unlink test failure reproducer loosely
related to xfstest 531 (see
https://bugzilla.kernel.org/show_bug.cgi?id=203271) which unlinks an
open file then tries to create a file with the same name before
closing the first file (which fails over SMB3/SMB3.11 mounts with
STATUS_DELETE_PENDING).

Presumably we could work around this by a "silly-rename" trick.
During delete we set delete on close for the file, then close it but
presumably we could check first if the file is open by another local
process and if so try to rename it?

Ideas?

-- 
Thanks,

Steve

