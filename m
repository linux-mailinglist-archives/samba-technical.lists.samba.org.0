Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D16552755
	for <lists+samba-technical@lfdr.de>; Tue, 25 Jun 2019 10:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=N5ewr/UDFPhyssMt8f8FeVWXsMEtnFpbKLjmf2i/IIc=; b=cLjSvgwVKguq6h3KQKhzoKKIVY
	4+ajv6ra+Mie45nxd9Y+hE5ycIRRitI+BPWnXwxzQN/cMB9YV632t5BZA5011XeyHYHczhIBrPmE9
	VoWPQpU248Bcw1ZgLCT9d6kWKBwe5L2nTuFNNwNUZWSRfzlMxo+nTQ6knaxHJpMPOmIbCuwu2R0wm
	2/0OzeU/cDAfE4q2Z5u9Z+NcuIUel1R/K1rBJw4THxfhgJJ6JkZVE3E5UKw2Z/e8d6zhWeN8u79tb
	CVnMT5sjVvYY4KY8F643tvzB+5/K2CJVpfhFuxbgU12tYIdAkD+HEcuqXiDIDTpPHycP7+xQpXzkw
	TxGcuaUQ==;
Received: from localhost ([::1]:46192 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfhI8-001Zuc-NG; Tue, 25 Jun 2019 08:59:04 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180]:34126) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfhI3-001ZuV-RE
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 08:59:02 +0000
Received: by mail-pl1-f180.google.com with SMTP id i2so8481701plt.1
 for <samba-technical@lists.samba.org>; Tue, 25 Jun 2019 01:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=N5ewr/UDFPhyssMt8f8FeVWXsMEtnFpbKLjmf2i/IIc=;
 b=sfPAI7ciYeFXBdJyFw4CuiPq2+2j3nVFPHKv431iBv8jgFY9/Af8cS2J10790tSn7e
 /h8E/XNKnFTaF9Mm6SCLANA1HoNFcPS90xhhw8NrjtbvJbzB/69G+jNgKoE+uo2ixYMm
 Ll1//mQGrPOsp2dma1uINfotn5WYrvJ6WzNI3h7BlZZFvY9BsnrsGKKcYMfeU6S/EuWJ
 6JtXCcrFGfwvd6IpQ5XoNMU7QBt1nasRTTpuhc7jNRsrRI0L3auuXZIUNovLOIuxuG4C
 ntui9e4DQ9FcyS33mok9DUq3aoBZSkIToXWgOdxeWgeXmml0/7uihzqwx+qLackd7FTj
 sWHw==
X-Gm-Message-State: APjAAAWXnJUhVtT6xl5EU9HVxy9+vX01TnDouULOtRFNnifMC19ZsuhA
 HM64DuDTv4icfx3DQldkzkAeeQwEgzw=
X-Google-Smtp-Source: APXvYqwhKYnOxMA6VjzXtJlZq+D8R5rTSiotPyMfMjaUUmy2rr9KGWuBRc6JLq23GMt7bpu2aEqKNg==
X-Received: by 2002:a17:902:b7c1:: with SMTP id
 v1mr60388695plz.85.1561453136753; 
 Tue, 25 Jun 2019 01:58:56 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id a21sm3828155pgd.45.2019.06.25.01.58.55
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 01:58:56 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: Few Merge Requests to be reviewed!!
Message-ID: <9f31d456-95fa-d231-7e82-3949c47ac627@redhat.com>
Date: Tue, 25 Jun 2019 14:28:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

Sorry to bother, can some one please review these:
https://gitlab.com/samba-team/samba/merge_requests/576
https://gitlab.com/samba-team/samba/merge_requests/569
https://gitlab.com/samba-team/samba/merge_requests/524
https://gitlab.com/samba-team/samba/merge_requests/515

Thanks
Amit


