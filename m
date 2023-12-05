Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E8F804BD5
	for <lists+samba-technical@lfdr.de>; Tue,  5 Dec 2023 09:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ucC2V86r7+sQa+Sx1lOQO+DRmR/o2qrcMTWj/76X1iE=; b=VlmnGeZNgQto5e+9d2eR8qsdRp
	0tphjpYxpVv0Ik2UmLosPmD3PlRJjbcqnk9LN6ATsVd3EaChSNqgBQhOxzcVvEjyos0Qsi9n2c1KD
	3pFv5hdSxHmaDY91JYKLve5xmliQv3yZGurxC1NueGsww3j1Sdsu+ebOc7qlGrMsSoyGUsInj1h2M
	O3E+N+0hvMbJAOvdIhmENLfE62jh0zx5mgcdyym6Y4cSn3muBM9lFM7AueHV+dWfIpIo+1Rk5XEad
	KpZkA2+uMdI7e7/KfO6MkgfeVUn40Zvaszq6DLDz9KOAHGFaargpDAAlKWn7+bOQPaOU4gNzcCI4h
	xTXQ+L6w==;
Received: from ip6-localhost ([::1]:64648 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rAQS7-004Ght-9w; Tue, 05 Dec 2023 08:06:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1]:53264) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rAQS3-004Ghj-4d
 for samba-technical@lists.samba.org; Tue, 05 Dec 2023 08:06:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 62323CE0946
 for <samba-technical@lists.samba.org>; Tue,  5 Dec 2023 07:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0CFC433C9
 for <samba-technical@lists.samba.org>; Tue,  5 Dec 2023 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701762485;
 bh=C6D0tLjPt3YkY5YoBs7Uj9K/0s2gcRdGIebkQ7OcGk0=;
 h=From:Date:Subject:To:From;
 b=OPSTIIjMZBPWjKvzj4GdvujQTV+DbIq3NGRJmz9uMYTWbBJJFa+amr6/JlQtodOUG
 +iZHQVkJIDMTe/EM+ztg5V5L/JPOQmEZqwuR0M4hZUljV1a4V61XcAKvoXpUWcQpvz
 WC1gGZRlTibUynErpiHGIoYP4Ty0mAI628F/KTUpTIxWXjc9WT5CEj2p+yYmI+fcqC
 kw4VBgJ98Ywxw+E2W4Ekkw+wlLaXRPJrWoBkT5pCXnQuDHL47mLfJmUud7qF6mUW8x
 MVE2yjNEEAe/HwjC+o5catj8Bg94HKAXp+siXOKytVjh1iPyRkGQwhToRMQw0q5zXN
 RXH8VMqPtNEpg==
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-1faf46f96ebso2443832fac.1
 for <samba-technical@lists.samba.org>; Mon, 04 Dec 2023 23:48:05 -0800 (PST)
X-Gm-Message-State: AOJu0YxCFS3O14zi6oIqXzxLxVF87fHixHajRF0ZErDfJjyM5B33cTgr
 TtzpZSNbd8ylz5Atg2R2dcfTldTGMRl/4McMJZo=
X-Google-Smtp-Source: AGHT+IGFvKbDumO/yFY9gPgUBCLeqsIvgmFpCai1pu68IuofO01ga+7en9K/PbtDESb/Y6ZHe2kxWKl7UPSNJJPn7Zo=
X-Received: by 2002:a05:6870:350f:b0:1fa:31c4:6fd9 with SMTP id
 k15-20020a056870350f00b001fa31c46fd9mr7730172oah.43.1701762484887; Mon, 04
 Dec 2023 23:48:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac9:5a85:0:b0:507:5de0:116e with HTTP; Mon, 4 Dec 2023
 23:48:03 -0800 (PST)
Date: Tue, 5 Dec 2023 16:48:03 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9-61f1cjXMrovSEdio8fuTSbegfde4FZ9m1DAAS+CxRg@mail.gmail.com>
Message-ID: <CAKYAXd9-61f1cjXMrovSEdio8fuTSbegfde4FZ9m1DAAS+CxRg@mail.gmail.com>
Subject: Name string of SMB2_CREATE_ALLOCATION_SIZE is AlSi or AISi ?
To: CIFS <linux-cifs@vger.kernel.org>, 
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I found that name strings of SMB2_CREATE_ALLOCATION_SIZE are different
between samba and cifs/ksmbd like the following. In the MS-SMB2
specification, the name of SMB2_CREATE_ALLOCATION_SIZE is defined as
AISi.
Is it a typo in the specification or is samba defining it incorrectly?

samba-4.19.2/libcli/smb/smb2_constants.h :
#define SMB2_CREATE_TAG_ALSI "AlSi"

/fs/smb/common/smb2pdu.h :
#define SMB2_CREATE_ALLOCATION_SIZE             "AISi"

Thanks.

