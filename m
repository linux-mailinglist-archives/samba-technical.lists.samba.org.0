Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF5FB32C1
	for <lists+samba-technical@lfdr.de>; Mon, 16 Sep 2019 02:08:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=g/k2Xf+d7mkaz/ieMCCT9oTQvxqoTtIT7nGYNKACE1o=; b=EUowfynUAbWhpDztyIxex5zU8r
	dySNIaUoGKdQcCg+seb4YgUF2aUwmxS01Ycl173Nhw2ISpSIzhyfcWLopIIll/D8uWh+FV13Tcbb0
	7XDU2O+L+usZMq0KpU2JZUa7NE1YiOJEVREflXQPvMD72dI9le9BBNou4A/Q0GPwF9mQeB+9RbCdJ
	ELB3KI5WiEZ30aTBTQRkDcrvzLZE8LDscCP3s9+qK51ySAipie2i7+lrUkzXeRKmkPy9M/xPjVqhN
	06XZPzevw4vQabfN4GDXguA/019/pdCs7oC12NseBWQe3f5hT+mgxnigAyWu0AyCfQB58hZdWmgXu
	Pz4KzRQg==;
Received: from localhost ([::1]:44706 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i9eY1-005p9y-KM; Mon, 16 Sep 2019 00:07:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35812) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i9eXw-005p9r-V5
 for samba-technical@lists.samba.org; Mon, 16 Sep 2019 00:07:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id v8so1653315wrt.2
 for <samba-technical@lists.samba.org>; Sun, 15 Sep 2019 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=g/k2Xf+d7mkaz/ieMCCT9oTQvxqoTtIT7nGYNKACE1o=;
 b=Or9XY37RL4uCQg1jcuNPtbFjxf4wOIUlDmpbNugyuC8MOqVqOpb1QDuDr18cpaMxz8
 a8z5Yw88GOiSY3Zj5x/nqGpp167DZQek2W/OqAiqsWeJFZCLHVRO667MtD6rOm0hkhwc
 aE3TvOOGYnU34fBb7tJ5m18Sk0BMC/7URQXZAyW0ogBcRH931obNNeGQQKgjR4luhl6S
 hRFGQbgb/ZUXSmuALgtkvtI3CB7V27wUlCXZxCMngB5ms3KxDMokplcb6qKK5xQhRv1r
 pTBh9fivtrFDiUVTcJ3use+XD4lCNFcvmhVomsMyROSEb9WMGBQvduXdrBdZThp4T3QL
 ryXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=g/k2Xf+d7mkaz/ieMCCT9oTQvxqoTtIT7nGYNKACE1o=;
 b=V4uGMn8zLoYBqFYu2LQq2PQ9yaQf6s+FrbhqSHW8909kFK+T5K0DTm2KkGsX2dgFDg
 tAKtQle2lps8QvtgtqF2hr0q1H5DFWR1OOn2VKkb2TdrfREdRYhAu1VxH8g5Ncvc1Os6
 cItAdma0uUJkkHEiuAEhv/+HgU68XosocwZj0wUmeiSiSr/bnUkDxjHCz/FWpvpVsolD
 2MCVCMshUGXeuZRx8VbFXZugWoO+lfTCM6fbVwGwSuViwU85i2MRtRKncb2lEvSIjIVF
 DqhFthImEqPVuoVYgxDUy7RBYZLG6Aoc3s2KQQRFXm0xYlQockpVdilaXGToTzAO33gp
 mfsA==
X-Gm-Message-State: APjAAAXzm0GlAIm33iD0yMZdfLfb0XhPR7spu4YiXF00Nh2ViM4T2Cxe
 YXnpNpsLfB9JmD53hp613Y/4v4q+w5lqrB4LCN0a558r
X-Google-Smtp-Source: APXvYqypoQjgSB91a771HeF5ibryMNMJCOJ+1ajMVxmtmGFtZdm7z8NVqVKvpEsAvxGeIZNPFqGxm0sHen/+BqUvKj8=
X-Received: by 2002:a5d:6043:: with SMTP id j3mr7674501wrt.337.1568592432166; 
 Sun, 15 Sep 2019 17:07:12 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 15 Sep 2019 17:04:17 -0700
Message-ID: <CACyXjPxfTd-DOVA3L1eqF_RZa_iKnnPEtiwX7dQP3jRr9kx3tw@mail.gmail.com>
Subject: Is it correct to have an INHERIT_ONLY, CI, OI ace with GENERIC_ALL as
 the only perm set?
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGkgZm9sa3MsDQoNCkkgaGF2ZSBhIGNhcHR1cmUgZnJvbSBhIEdFVCBJTkZPIFNFQyBJTkZPIGZy
b20gYSBOZXRBcHAgQy1Nb2RlDQpzaW11bGF0b3Igd2hlcmUgb25lIG9mIHRoZSB0d28gQUNFcyBv
biBhIGRpciBpcyBhbiBJTywgQ0ksIE9JIEFDRSB3aXRoDQpHRU5FUklDX0FMTCBhcyBpdHMgb25s
eSBwZXJtaXNzaW9uIGJpdCBzZXQuDQoNCklzIHRoaXMgbGVnYWw/DQoNCklmIHNvLCBJIGd1ZXNz
IGl0IG1hcHMgdG8gMHgxZjAxZmYNCg0KLS0gDQpSZWdhcmRzLA0KUmljaGFyZCBTaGFycGUNCijk
vZXku6Xop6PmhoLvvJ/llK/mnInmnZzlurfjgIItLeabueaTjSko5Lyg6K+05p2c5bq35piv6YWS
55qE5Y+R5piO6ICFKQ0K

