Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 022FC5FCA6
	for <lists+samba-technical@lfdr.de>; Thu,  4 Jul 2019 19:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=1UxxH7iWrmP6st4fiwsTXGm9psCK/pq6iWYS0Sg1HxY=; b=5damZwLedoV2/tz/HXk9f/boNV
	gxaDct7SvbO0FX0of7SYreis21c+mNFc/gUIa5uDY5fIYrx6xUPTZHeo3j6ZHyKUloVE992duJLjl
	UqiwaSGfIawBwykZVlbQglT81oiONmQ2Rz1zKyX7aEj4mknF1tTI/+YhsYZ+TYCzJd1++Q+hqKIRb
	x9md3PWuFI/ze2Q6gb45JAv/R/Qzojc7n385XLrI8Mxcj5aAj75mcZswf4PuU60t+h1SK8+p21Yqm
	6I+w2askVItpt6bpoqVv5VKAVhS9NeJ/XTp9YfMwLeibIviYWLKg01IH31uDJNtWntmfxacl8ebEi
	czlsKn0g==;
Received: from localhost ([::1]:51016 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hj5vp-005Dwx-4n; Thu, 04 Jul 2019 17:54:05 +0000
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43764) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hj5vk-005Dwf-Sh
 for samba-technical@lists.samba.org; Thu, 04 Jul 2019 17:54:03 +0000
Received: by mail-qt1-f196.google.com with SMTP id w17so5581480qto.10
 for <samba-technical@lists.samba.org>; Thu, 04 Jul 2019 10:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1UxxH7iWrmP6st4fiwsTXGm9psCK/pq6iWYS0Sg1HxY=;
 b=Rua5tl+MriKtUp4hvPv6X/vaZzDxK2JzzXCmNx0WhtVwaZ2+bk1UyExi82j5X1tWhs
 GnP3OiyNTHHV8pV7dpVQsFg7DQVpxytQxCBJeSqKsljfEXZmzgtag11EAh08eSueDpHC
 dr76WSX4zsEay099uu5QRG6yNSmmSpFMFu98qoGEcSadbftEhv0jb9GO6/wqWc1VM+xL
 UOWrzs21jXUANzA9phfEwDPXBtvMeKZivaeL6ra75uEQ8gRWAl+m3Wcbw0h799PlcKTT
 rhR7YZZTd0G1Ep/lD/lFqUNAwA1G3vG1cy71T2OAs3m1mBbNMAEIPwWKkNqxyXcV1qfG
 Mitg==
X-Gm-Message-State: APjAAAW/3jyRt2kuaNkXJctzv+pVJ80iK9xhKutLFSOThgniIad52hK1
 78foXaEtxXO80jONQKKeg4AFkSIiHXIKvA==
X-Google-Smtp-Source: APXvYqzdlBTzg/S5tYpiKsSS+JppaG4fksXvUKyFyV64ok8b0vWbZzfnWo/dBwmBlZvwQvQZe+2SQg==
X-Received: by 2002:a05:6214:141:: with SMTP id
 x1mr19959457qvs.104.1562262839132; 
 Thu, 04 Jul 2019 10:53:59 -0700 (PDT)
Received: from ctdbdebian.celeiro.br. ([191.177.182.250])
 by smtp.gmail.com with ESMTPSA id w16sm2510034qki.36.2019.07.04.10.53.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 10:53:58 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: [PATCH] ctdb-config: depend on /etc/default/nodes file
Date: Thu,  4 Jul 2019 17:53:55 +0000
Message-Id: <20190704175355.24272-1-rafaeldtinoco@ubuntu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Rafael David Tinoco via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
Cc: rafaeldtinoco@ubuntu.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

CTDB should start as a disabled unit (systemd) in most of the
distributions and, when trying to enable it for the first time, user
should get an unconfigured, or similar, error.

Depending on /etc/ctdb/nodes file will give a clear direction to final
user on what is needed in order to get cluster up and running. It should
work like previous ENABLED=NO variables in SySV like initialization
scripts.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14026

Signed-off-by: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
---
 ctdb/config/ctdb.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ctdb/config/ctdb.service b/ctdb/config/ctdb.service
index 675b3147417..fd81c38e26d 100644
--- a/ctdb/config/ctdb.service
+++ b/ctdb/config/ctdb.service
@@ -2,6 +2,7 @@
 Description=CTDB
 Documentation=man:ctdbd(1) man:ctdb(7)
 After=network-online.target time-sync.target
+ConditionFileNotEmpty=/etc/ctdb/nodes
 
 [Service]
 Type=forking
-- 
2.20.1


