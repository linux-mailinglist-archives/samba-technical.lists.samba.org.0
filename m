Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2C54D5997
	for <lists+samba-technical@lfdr.de>; Fri, 11 Mar 2022 05:32:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=vqpljt6ZpyAjIUia5P3lm3uadIOWvOoOHCdqVEXnM3M=; b=BvxYsPdQnSpfB61Jekw6Ls0F03
	/J0X4VBzjMNOwvLaeyT3AzaUJLHZyL9OB1Py/twTJaCuCLJzRChld8S7VbjJ51P/JbsHIgrPhcNRZ
	n2JYoUro1LpM6xLQlXot6WJGNJHQvRNhHwi+trvwCXxFkk5M0ctE0l6+0BniSOmI7B8QsjEqXf2I4
	7bBYTtyXi/2A+LOimCHm5tiSjYHfxytwjHssfj7uEA8BJfpCZgh/tb3rPEDAeqCkEpB4Ls1gBXoW/
	3RXvKJaTQsWS1HSl4ly103yTl0MaJ9jnY4aGSF/6z6OKFdRBgthA/buFTdKdN1d3MQokbL54BPDIZ
	IB0T8uQA==;
Received: from ip6-localhost ([::1]:63876 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nSWve-001Zzx-LF; Fri, 11 Mar 2022 04:31:02 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:46686) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nSWvY-001Zzo-OP
 for samba-technical@lists.samba.org; Fri, 11 Mar 2022 04:30:59 +0000
Received: from [192.168.1.80] (115-189-131-117.mobile.spark.co.nz
 [115.189.131.117])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: josephsutton@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 95512817C0
 for <samba-technical@lists.samba.org>; Fri, 11 Mar 2022 17:06:09 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1646971570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vqpljt6ZpyAjIUia5P3lm3uadIOWvOoOHCdqVEXnM3M=;
 b=Kux7Ph9nIOilDbu7xiemV8E/40SXfSwAxDfXA47LJ4ND/Dt2pGytdDf5qCEA3oPBNKIExq
 2us1JE2wy9xi+yZQT6zojtSWLnDqYIS/y6Z4fResyAkTBVbEfN4pumflTM3e2zeW8HHAhg
 uMASiY7hkeY7bnA7vsbMZUkBOUtFp7/rWqXIlfhfA8Vc7npsk2XlhSflXwFWQzs2tjRU/O
 TGvcA2neXFY4l1vidKokj4p3+PGtypleaBQmOzr2vnr4zy7hz2kjUVq4QF9HrOUHKJ3DW6
 7VFb3MwYZi8rLd1yKHmXMBeWfiCg4J8fRNfAn1oyCOOOMKmHv5nGZwr7OFTCqQ==
Message-ID: <abca441b-aae3-5a1b-7415-d596bc4877ea@catalyst.net.nz>
Date: Fri, 11 Mar 2022 17:06:00 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: samba-ad-dc-1 CI job is slow
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=josephsutton@catalyst.net.nz
 smtp.mailfrom=josephsutton@catalyst.net.nz
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 ASN(0.00)[asn:4771, ipnet:115.189.128.0/20, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
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
From: Joseph Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph Sutton <josephsutton@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

This is a heads-up/warning that something has been affecting the
samba-ad-dc-1 CI job since several hours ago, causing it to run more
slowly than usual. All Samba CI pipelines are currently failing due to
timeouts as a result.

Just something to be aware of if you're going to be running any pipelines.

Regards,
Joseph


