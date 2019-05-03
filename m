Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610413323
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 19:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=XALMJp6kamIQzioRcBXHcRjA9AsZln7EKp3lpvcUmkw=; b=bd8GBihF1YNT1jMTMWNjcsAxVC
	84PQ/iqX0Y16L1famHaIUBx0wHtaZKxOOC/sEybuH0Fq8Zdk7kRGIRN2e523are6ZELsPyl+zMfki
	dcSG3b8tp9m8J7Sw4Hdk9+rc9nXUTJwIJZEJDh4CtWxYpW4uOjYjrlOUtFM5BiG+VIHf1pfkNZ//t
	XgwaJsTp37TjzYYPWtFcL3Zya5ug8GQn4wAepQZbsoaiy6+K5y1O0MQGDvhMrpoHo3RBBREBDNWU+
	/R1tBCpzisFm+ajfuhlb6GIz32Aid4lWLlcqwaWTsFRBKGUelsZQttDOGkzoo1aEzMx7fCS0UbziA
	Ij1V+CCg==;
Received: from localhost ([::1]:32594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMbzb-002Jfq-8D; Fri, 03 May 2019 17:29:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:18954) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMbzV-002Jfj-G3
 for samba-technical@lists.samba.org; Fri, 03 May 2019 17:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=XALMJp6kamIQzioRcBXHcRjA9AsZln7EKp3lpvcUmkw=; b=rHPCbjCqtC3HwqXDocQUPZ2ruR
 qLzPwIPQZkftaXn2JOFYFWJ1TaOxwO9xu6ZBQL2Ga866XuBdAW+7rqEt8yPRSD0F1Qn8gKHDqIVpY
 EMRZXrumYt3JVtXCxGUFEvDriFOZFrdAE9YLM8m64Un49cAxLLc0s+k+0H3rFi8GMRs0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hMbzR-0006E4-EL; Fri, 03 May 2019 17:28:53 +0000
Message-ID: <38fcada0745ba8dd4517ceb541cbac768652f844.camel@samba.org>
Subject: Re: [PROPOSAL] Evict zlib
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
Date: Fri, 03 May 2019 13:28:52 -0400
In-Reply-To: <1556868232.2951.47.camel@samba.org>
References: <1556868232.2951.47.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Simo via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo <simo@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

If by removing you mean unbundling then that's a big +1

Simo.

On Fri, 2019-05-03 at 19:23 +1200, Andrew Bartlett via samba-technical
wrote:
> It was recently pointed out that unused cryptography can be a pain for
> users of our tarball.  I also recently did some work[1] where we
> documented the location of cryptography in Samba.
> 
> With GnuTLS being a requirement now, I think zlib is also a reasonable
> requirement and removing it would also remove some bad and un-used
> crypto from the tree.
> 
> What do folks think?
> 
> Andrew Bartlett
> 
> [1] https://gitlab.com/catalyst-samba/samba-docs/wikis/cryptography/where-is-the-raw-crypto-implemented
> 


