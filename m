Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F19583014
	for <lists+samba-technical@lfdr.de>; Tue,  6 Aug 2019 12:53:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5Skrnj7g7HI++ugbJGbvKuh7+3JtPqtTrDLMGais8Jc=; b=KNPhtDkb7Jn4pGTU+c8YQIrQAP
	6vx0ywg0DXwkezsO/XK85VXwI1/t+GHemOQLZZ2ePJfnTNWKKHYMRdZuDk5/+vDX9FSvtqurvfksW
	a9qzH1c68mhS4CTf97ym3ELLnVhoGhVfqLAdZXf72TRB567OvMDrPEyqteWeVMZpS/rlQlZa+uF3l
	b3pGbhL3xJpDBu9d6NE3ilOjyup05skR+11WpsnyAFphRCobqCVMsRscqTbIDcOuI5eAcx5CJBMNe
	ewwRtWCEFXHkwKQRCrM2rT7GkEjH7zFA43WJ7+6K7g2RJlUum6haoJ85iusT8zzhxD2P5STnkgTPx
	r1mbLQNw==;
Received: from localhost ([::1]:33440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hux5L-004aXi-8j; Tue, 06 Aug 2019 10:52:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31378) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hux5H-004aXb-8Z
 for samba-technical@lists.samba.org; Tue, 06 Aug 2019 10:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=5Skrnj7g7HI++ugbJGbvKuh7+3JtPqtTrDLMGais8Jc=; b=f/0eI4FHX4rxlRKXgFVuGT5MnE
 c485T0VljBxw/GmZl6Z2lZCHUxgN5s29Zomp16sHURtPgWSwMazdt9+9UwOH+O2wBU9zZdzOl3YTq
 s0B0VFgFX54Rsh0wZjLRPQ5neD8lO2NjwBQLAVX4Wy9ftZ81Rkasc2Y9OB0f74IF3jLw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hux5G-0004yC-Jq; Tue, 06 Aug 2019 10:52:50 +0000
To: scabrero@samba.org
Subject: [MR] http client library improvements
Message-ID: <d1245e3f-5232-f76c-b629-a8e5827b81fb@samba.org>
Date: Tue, 6 Aug 2019 12:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Samuel,

I have a small patchset with improvements for the s4 http client library
and noticed that this is originally your code, so I felt like you would
be the natural reviewer. :)

Can you take a look at my merge request?

<https://gitlab.com/samba-team/samba/merge_requests/693>

I noticed that you don't seem to be a member of the samba-team@gitlab
yet. Do you have a gitlab account that I can send an invite to? If not,
would you like to create one?

Cheerio!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

