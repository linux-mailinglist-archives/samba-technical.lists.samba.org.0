Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D688A5843
	for <lists+samba-technical@lfdr.de>; Mon, 15 Apr 2024 18:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=WCkGk/wyeJPxvX4GPCPt5k2Ckw/YjVz9eWkCKVmg0Es=; b=sI/2R9QcL1CVBkesussnuo1hoV
	Ika+xGz7eEzrDgUEReQPJDZ7P5EtR1BmXUTyEffz+JH2OUvhDgT+k1Y00IrnFj2PB4fFSjJf+ctei
	dsc52dsB2s0lYzaeGhALSm8WvzlOuOA1nsgBaDR3vFqmaK6Aq815RcXBNDuYycnAlYAF5er0/tP6F
	dz0hi2Asxbo4DY8izJhj6wFNNaCa1bacYwLANhHRu4XK3uAW7TbxAbHh8JsvMe73OkBewR7sv0F4+
	spuawCRiuF7r+GEA/E82YUC+gY68/jwysNppmbNQuEUAI9xG/el0Td5pzfBdsVqPkS0+olJiRaI6o
	bpAOQhpA==;
Received: from ip6-localhost ([::1]:58262 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rwPb5-004put-9L; Mon, 15 Apr 2024 16:54:23 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:48537) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rwPb0-004pum-Qu
 for samba-technical@lists.samba.org; Mon, 15 Apr 2024 16:54:21 +0000
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d8a24f8a3cso37130981fa.1
 for <samba-technical@lists.samba.org>; Mon, 15 Apr 2024 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713200056; x=1713804856; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WCkGk/wyeJPxvX4GPCPt5k2Ckw/YjVz9eWkCKVmg0Es=;
 b=EdMBqPoODcCzRIlPpCLt7K2a1QtbewZPLLgBg0jLGpxiac5NxRtgz3BbJbGqFf2G2y
 GhJ+YrjuocD+4kTjF0X9Nfh5rt27kCEGEY/px7W4Wq/Gazqd8LzCnahfmXAM2fesy6BD
 XgHLBWluI4YBXHKZBx9fB3fTiJRXNvRsfHi7ejZURFGgIHnn6OQlQRhMNrjgGGBwbh2C
 UIRdg+etmCnG6nvEpoKGVviMAWywoek6ovyPkZVBdiTprwO3BasjN73yLC+UV96zFQ+0
 5tg4jVhs20eJr7emXphNZOD6Fim0LtRDPfrqg7y5LOHUNFZ6+GD7o6Ahy/S75CE/ctXa
 YqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713200056; x=1713804856;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WCkGk/wyeJPxvX4GPCPt5k2Ckw/YjVz9eWkCKVmg0Es=;
 b=jKn5QqjiXuJNxjVzUj+H9KjlvRYUQF43SOgA3EypEKZfxFGwW8weo52zgjHYaZMk4f
 fSEOQYnsI83G7v5yeI6oJAjR0vJuaLOW7cZy6QVELDtjPhP5vguW65lQhucm5EGygCPn
 U9r0cVfSTksPSUXqfPXZ9Qx9c5uikwX3mYVHiQAw/NC53AoN9lfz7B8wnXmWpLIVtlDo
 qCjU9D9XMz0UqT5QSiVtVFJ/K1elvN51qdyYLTQJKnJTASvN+jSyW//f5J8AblGIyA15
 88hRVXDS6ECjo4xUyNyrnlCsIkUEKJ3/Ys+Y0nDOqhU1e3rplt7guCxRJoXQMu1Pearc
 H1iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4bM31m0ulzlVTOdEAX/4fw4+vRhyPUCvaOwOl3SyWqKbCySh12eYBXFUuddNkcH8UNLp5rtovwThEwcjTpxsGYKbDDLS3OBQAe0lqmnU7
X-Gm-Message-State: AOJu0Yw490epvEwNhT55zWAW/7HqZpPTgopH8t+QWVQodgix+n3nqC+a
 wbhZKSvYae7/VJnDpbl6rGpwF2kWsH6xoSj5Ci7dxrOr39oZMnGVJnCCFPjdVghepabThgnPO8I
 arS7uheRdLwjCdIbgl2n3NKfKzCU=
X-Google-Smtp-Source: AGHT+IE3mnc1QgRI8s4hmIaW7FSoRefXUw9LoIh/n0ONRWa5C48H8mvN0QPp2+WdS7LYC2EMhJ3uKAdWZ5qmC697rCA=
X-Received: by 2002:a05:651c:10ba:b0:2d6:db84:5e93 with SMTP id
 k26-20020a05651c10ba00b002d6db845e93mr5508160ljn.47.1713200056351; Mon, 15
 Apr 2024 09:54:16 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 15 Apr 2024 11:54:04 -0500
Message-ID: <CAH2r5ms7EWvNFVJ7_D7QXWOyj+oViKDJD2EuoY3n=w1c5wLTKQ@mail.gmail.com>
Subject: current ksmbd
To: Namjae Jeon <linkinjeon@kernel.org>, CIFS <linux-cifs@vger.kernel.org>, 
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

We are up to 221 fstests run vs. ksmbd, and buildbot tests pass with
current ksmb (this is with 6.9-rc4):
http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/10/builds/52

There are lots of minor features (and some fixes) that should be able
to be doable to increase this number even more.

Note that Samba passes some tests that are skipped when run to ksmbd
that should be investigated:
e.g. generic/022 ("xfs_io fcollapse") and generic/351 ("xfs_io
fsinsert") and also generic/021 and 031 ("fallocate: Invalid argument)
and generic/525 ("pread: invalid argument") and generic/568 (which
looks like fallocate bug)

Samba fails two tests that pass to ksmbd generic/286 ("create sparse
file failed") and generic/591 (splice test) that also should be
investigated.


-- 
Thanks,

Steve

