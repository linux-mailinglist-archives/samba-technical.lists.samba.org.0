Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9164F6506DC
	for <lists+samba-technical@lfdr.de>; Mon, 19 Dec 2022 04:40:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=fOsz24SJU5cd0R8Y8Yi9oU6GvQ8ZRNcX6jj3MlP1EUI=; b=buIn8a3rxjGVyfeFpZuSWpJCwm
	XNKcLLryp6s1nQj1rYMr25ilrl+2+X9G/IAQ0AjonDbTK/IUmZit74+CbiYvkCnFp30woTBFG8nwb
	IPFGcL6fFctdz5NeC/vH+T625+ZViSOn4JYovZ7p+Hg7szVDoEWWH5BtCvEGXGIpKl7I+3jikIOpE
	QGfbVSNTcsKrcMY09b2SZG8rs3C5elALkiNrkMO6PXoRteEgQmDqf89RsunTsCfQaVp97REMkG7Gw
	xvMn3RbFaziEPYHdMAMBWIZKGUrtwJUkV1x3lmy7Y28/+g/ikQ92oV150YS1Xfwo75OWhfs1G7FjB
	cDIfK+Lg==;
Received: from ip6-localhost ([::1]:52090 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p770D-00A8VK-5b; Mon, 19 Dec 2022 03:39:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33690) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p7706-00A8VA-KW
 for samba-technical@lists.samba.org; Mon, 19 Dec 2022 03:39:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id bx10so7458098wrb.0
 for <samba-technical@lists.samba.org>; Sun, 18 Dec 2022 19:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=karpukhin.com; s=google;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=fOsz24SJU5cd0R8Y8Yi9oU6GvQ8ZRNcX6jj3MlP1EUI=;
 b=lc0f32/1tBw3sJZf828zsJaWcOLoVTerWQWnBDRCOJx+L4cgxTmK1qYzl2VK0wVv0R
 ZOh3pXUpwbPdklUFjtpIuNqg7CLT29jyfwXPoqdYzE9ljvF+118Ytsc/5AQrbPNapxwF
 pLc5H+Krw5Uw0VrWSKhBTTddKm4FLMpiiuCYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fOsz24SJU5cd0R8Y8Yi9oU6GvQ8ZRNcX6jj3MlP1EUI=;
 b=F3NZQlh3Znhv7Klxwi/cO7Ex4mZRAC99hMm8pVbzAFMNMnEjEP/Pd2XFFETn2UKbdS
 e1/Lq4TUZJjnavGy5vKrwWtFec4+uu4lsqgaj3ppBem5wXAMtxu8NP48qQF3F3xTN7/T
 WzO+StOFIhI1OniBIu3COKSLY1AsPtzWRbPThSePR80XN0Yk2v6UrDzfRPywJWJ7fsh0
 mREYK/U+9zrNxUKnCFBEVPozDuCqhwgutoOUrSP6gEZ2uGyX9OoMpmavGjSdfflpDNco
 D8a/DUo8ebqUAaOqt3UqZQeF7HDWSNyBMae+CPyr7S8ND+39jOkSpH8Py9D+h0sxmQe2
 eQlg==
X-Gm-Message-State: ANoB5pmU/7Wd3c25ei+gsCchl5plOP5tB6QlwJVYa9pJWbYBOhc2t/1s
 D9NAdCZw9R35v8JhkqwnfQ+wFftf4+dSZr/TpYg=
X-Google-Smtp-Source: AA0mqf4yag1HvAlpLVeeX22KNR7zHp5wm+fpySrsR9dIUCQ4zQzJ1OLnI6aFqkz6WG9iWNxVcb+BSw==
X-Received: by 2002:a5d:5488:0:b0:242:2d4b:c8b2 with SMTP id
 h8-20020a5d5488000000b002422d4bc8b2mr23924542wrv.62.1671421177615; 
 Sun, 18 Dec 2022 19:39:37 -0800 (PST)
Received: from smtpclient.apple ([2001:a61:2424:5600:d85e:a173:5190:379f])
 by smtp.gmail.com with ESMTPSA id
 c16-20020adffb50000000b002365254ea42sm8797072wrs.1.2022.12.18.19.39.37
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Dec 2022 19:39:37 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: "access based share enum" is broken since 4.16.0
Message-Id: <D3FFCE09-CD20-485D-9925-6EB995A8B6E5@karpukhin.com>
Date: Mon, 19 Dec 2022 04:39:36 +0100
To: samba-technical@lists.samba.org
X-Mailer: Apple Mail (2.3696.120.41.1.1)
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
From: Vyacheslav Karpukhin via samba-technical
 <samba-technical@lists.samba.org>
Reply-To: Vyacheslav Karpukhin <vyacheslav@karpukhin.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

It looks like the access-based share listing is broken in the recent =
versions: "smbclient -L" shows no shares if this option is used. =
Bisecting points at a7c65958a15149918415b7456d6f20ee8c9669d2. I rolled =
back to 4.15 for now.

Regards,
Vyacheslav=

