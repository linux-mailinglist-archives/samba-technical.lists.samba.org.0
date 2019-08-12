Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC2389843
	for <lists+samba-technical@lfdr.de>; Mon, 12 Aug 2019 09:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=eGon4wbSvqZfYOMdjf1xejEBj8ZK7qwh0gvkJlaPgmc=; b=3PA4E1GCObrsj67yne8rUF3OLV
	Hnnm7DMgDgygSlJQE/dMX8oexYgmxf4g3n1ed0ROAR5K0cHJ+L14HJG+vxWcHMlPEOaITN9XG29uX
	8YaUWOByVUF35ZJMDvY8gMQ3AzS5yyjeucu/aPx2qHaBrP7jyV1FQuJg8NPwf9BbIUITpIofYrJhW
	pmddSee8jv+1gBxuDqsIqpKEq/h1Y5uTc70JNLyvDN9psCuPdVbsbxgIuqx6xFwTwbT7kv1MudMZd
	thFqKjk4o/jOcIT+5NmdLiz8pyOmNDiIl6Mjh6jtR4cPqCfoR2rmlLrbA8I8YxEogUW5tYOwRMigt
	q3yXEq+A==;
Received: from localhost ([::1]:22518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hx55T-005pIT-Lz; Mon, 12 Aug 2019 07:49:51 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:43027) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hx55O-005pIM-0S
 for samba-technical@lists.samba.org; Mon, 12 Aug 2019 07:49:48 +0000
Received: by mail-lf1-x12c.google.com with SMTP id c19so73614039lfm.10
 for <samba-technical@lists.samba.org>; Mon, 12 Aug 2019 00:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mOYI6p1LaIfLHWCDCBisnhUmtpHiTdJFzjVmC9FuYu0=;
 b=E3hplr3KHcNinaEA87RxykBS18EV14WvjgIMPSEWihP1UE8oAHta/cw8rOcvGbJH4G
 xq5IM3GBLwdNUpE6Ukc1Ej5lsMP2IVnO2TYFAWuWepWXsVPAmT3WbtFritKtblks+j3o
 lyvov4/BnQhdaRhxbCcRhhJ7k3CBO2iZ38S29oiM5Nzr7Hpct54BlI3s1/zbiF5d9e5P
 rqdIzmRrYpTg10IK1/fQIphlY4zpPsjBoKEUGbR5wgojmJc+0ie1JoNHKdRME9Rapd0E
 fdRa8bxs+cs3LwVh/z/oMXXZgZUZT60OFMlrom1JAdfU0xWdIZPdS0xzCY52YJn9V3kk
 wmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mOYI6p1LaIfLHWCDCBisnhUmtpHiTdJFzjVmC9FuYu0=;
 b=TmKA15JS6O1gm00i/5jBWF6X+xOhJrCqtrn92a79JUvLFCT0qHEruPpYM8iGRwK2v/
 rZUUz+5KMGphlnq6cyFX5+5v3yxX355rFL/DxU0BUH66pYmGnisksz1XPtCMzvcZLXIQ
 a2QkJFHJECKB6QblfIf1w2eieFj7G9dGD/pBSP8eXPlOrZhbWuT4/PJP2wTp4eG4b0yM
 EiIZ9sylgkAwvA8KNvziNLssmjrIBc1YI8g1Un178BZNfIzx5M9X4WeOW01c4cRinH1+
 8NHSHcO2d4ZvAy3tInHnMUDpdw4GV0wW2+N06/XxV3ybxD/Eo4TiP+2RRn/ehmwD8K3n
 XX7w==
X-Gm-Message-State: APjAAAVDY5zXgVHtiWyCQj0Uo+23p37wYvo/j7hNOZVffQMNPxUmrsJ3
 lhwtR1a+FbMprjgYi/UQKSCn83SyZcc0a65mtZIW2lVa
X-Google-Smtp-Source: APXvYqxBxDlTfMOwIpawNa0jdiAszW3kQImdSiV9FKxFaHVIlnnSLmPr1CkCzfYKEyg7SNu5qTOJC19ZlT0Rj77TYZ4=
X-Received: by 2002:ac2:44cb:: with SMTP id d11mr18021371lfm.59.1565596184766; 
 Mon, 12 Aug 2019 00:49:44 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 12 Aug 2019 08:49:33 +0100
Message-ID: <CAELK94cOwHqaotchnGzhT7t-Dmp-7ZgCmBVXoZgEbyQ55nJCLQ@mail.gmail.com>
Subject: GSOC 2019: Improve smbcmp - week 9
To: P Mairo via samba-technical <samba-technical@lists.samba.org>
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, or this week I did mainly the GUI development using wxpython as
mentioned previously, an usable version is almost finished, trying my best
to finish before Thursday (deadline next monday). The repository is linked
below.

-- 
https://github.com/aaptel/smbcmp <https://github.com/RMPR>
