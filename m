Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 036AD4B40F6
	for <lists+samba-technical@lfdr.de>; Mon, 14 Feb 2022 05:38:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Go53x7fLrGVS8R6NcFCsgJ8+wjG+1FnhzRpLIcH0RnA=; b=rD4Pf+PABJOeMmiXqlXO4qJoTx
	8jOiYPDslMgOjLRSTvyGjCsE7lVE7dg4yuwVSzTnsWjuvgTR/3qekPNmn0Iv9NsnFlVgYMieVSaFz
	Ar4b+LmQUJ798lMTrNpc8SwGPRI/E89hM/MUtbRTQ7mOlC9Go+Fke9Uqx2iiKGuCY9ENpoBzttLQW
	30GMBnchEOnJwSqweS8LxBLsV0zHZnVlXevGdyQJb5Wz0jtOUE31d3xXDeTww/tyabzUhmrvVRAZM
	dQy/+U3v9Km9ccNZCBGNxZthUTUZquSLdsuSSQbWBpDyVxIAyuzo5do55SuNc7VCSSehAxYn30ddr
	D1wpH0Vw==;
Received: from ip6-localhost ([::1]:43366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nJT7Q-007mel-84; Mon, 14 Feb 2022 04:37:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48944) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nJT7K-007mec-2Q
 for samba-technical@lists.samba.org; Mon, 14 Feb 2022 04:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Go53x7fLrGVS8R6NcFCsgJ8+wjG+1FnhzRpLIcH0RnA=; b=a9mVt2fVmAqbvonmxBwBuLZLhv
 OhOfW91h7+7dtwBeETTyM/iBFQAEXuE43UAQLo/J+n6cluBaHqE+LBoRdcrZCsOMWVMqgw5y93PIm
 XepDRhDvsmTArVTn4SOjQwnzK9ApUQAdA/Q6ZZX7RZQlFHXpqNGh127SUwJsaalhsgiXrzgiijz9O
 TlSuZqa9dM76+tlOKoE7LuQUV5u8xo7ma7N5JFnUo3hDBOqYjf5zpvEuCzA1AdccVUVrgrrQWcoST
 Vn3IBL+x7ObkvQlG/yMrlGjclZWLbJRQ3jIU5hpKouE4uRmKAnZTyhuKgpHnL9DcmVEL/HpNqbi0z
 JOIsazDKw1ryYUqvlZfXgjCYqPUciws6ohL+g9sGWvb5vUkz+cW+KTJWJr1l9Z7yOGCvCYOUz4re7
 deJtfJ0sNGf8UYMivW9Xl4l7ykRuLA3XqTA0PuZ4VAj2oK6pi/o7brqg8tp8eUE2jOD/JePKMGXNO
 MZtoubqgSjiiTRX2NsPQvgCU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nJT7J-003cAc-3q
 for samba-technical@lists.samba.org; Mon, 14 Feb 2022 04:37:37 +0000
Message-ID: <b1f45529d772a0daf5da99cb48e9ce2d0161a36b.camel@samba.org>
Subject: GitLab runners rebuilt
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 14 Feb 2022 17:37:30 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I've rebuilt the runner host and the runners should start a bit faster
again with new base images (they should have more of the updates
already applied).

I see jobs are succeeding so I think things are OK.

Andrew 'I only test in production' Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


