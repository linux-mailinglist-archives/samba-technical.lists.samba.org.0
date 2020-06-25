Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6702099B7
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jun 2020 08:12:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ZBpjght3WVAwFLbhMsYzKezeTdAE62aKuNdOhcau0pE=; b=25RVkH3SDsjWkIvSRm5O4lHQi3
	8n5kN5KqFs8kgWsbyD6vamlBBe7xYy8iqRDNh0vF5Zr2p8ctTv0AFwIEJYnF45SwzUpRyeG3RjS60
	BnIkBJDe0L6eHV6xj1+2/I28vQ4kay9bPKLN53780g3VhysQ7CNW/PPtEcSH6phOZbAelOgsCyMTm
	eqaxny6x3fnWdahTsnQkG5GI9mGiGIp/rDdrZ+DroUP6FpEQ7U8pAl5N+Hncjf+3nTGPr1KYt05RA
	vDMrIclmScXDSXco7CunAq+lmhbJWM5cIzAF3NyvCfiqJi6zgM1XWglIaoyR507q7Q8G20J3g6ZNG
	gMg+Mw0Q==;
Received: from localhost ([::1]:64136 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1joL7f-002FRZ-DD; Thu, 25 Jun 2020 06:12:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33952) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1joL7Z-002FRS-Ve
 for samba-technical@lists.samba.org; Thu, 25 Jun 2020 06:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ZBpjght3WVAwFLbhMsYzKezeTdAE62aKuNdOhcau0pE=; b=a9EHI4G+8v/CU4HOW2XNLiz+gF
 2yVUUkWDp1pMwrXGNXfhEHBNnky4MLh6PEGQ4kLFMAsDdOfV2owNhb5rPC5jF1+KIPQ4ZRSnsF5nl
 ia8VCeovQXM8L+AmlG76jihQR064o6UskuhVxVSBNp0DKQ5Q9pC2vSEMO6yq+667wzPa8nTwJji/j
 cUBvlCu0NTgxvrpk3gxhU05ZqZePKqXFgI/fpn5iH/5nKpPZ3aHZpIVMqTGLnQk8KgZDphaoSkjLS
 76aPu153FfvMMFXb7DnNeT3ymBhEswM04TVv0CCcMj3jcUWu26EJhoWt7Jr6U0VhvKbn+ycjbuJpw
 FYRqpoLCYmH0MpKka1QkV2UM9dT0W4wluY6JdbC3TKS3w/swHAcq/1vY8XCZQcth1Aqzk4a2qMII2
 EEQCJDK02+11X3lN9w4G+vtOZI8jACD6j3ogeIkwWBfyMPY+xNL2JyCZZuzfsgYy/TMXRW4KaebHe
 3NwfJaj1Oeq3KJ9DTih+x72F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1joL7X-0006MJ-DN; Thu, 25 Jun 2020 06:12:23 +0000
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
Date: Thu, 25 Jun 2020 08:12:23 +0200
Message-ID: <7484973.xYi0c40AKt@magrathea>
In-Reply-To: <20200608231733.GA839@samba.org>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <b20bcf09b119aa0d0585d27b24076bdd17157caa.camel@samba.org>
 <20200608231733.GA839@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>, Christof Schmitt <cs@samba.org>,
 swen@linux.ibm.com,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 9 June 2020 01:17:34 CEST Christof Schmitt via samba-technical 
wrote:
> Hi Andrew,

Hi Christof,

> I suspect that would also
> trigger a wider discussion, e.g. which ASN.1 library to use

I can already answer you that question: libtasn1

a) It is a dependency of GnuTLS
b) It is already in use by lib/mscat/

	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



