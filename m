Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ABC6E500A
	for <lists+samba-technical@lfdr.de>; Mon, 17 Apr 2023 20:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cmgTDdB+c1ObYWFjPtgDTfFMPeMWnaJfuC5QSLBrrv0=; b=jUaIk0UNCnV/sOpDrsHQa2ToVW
	ePt0xOxErXUyo6T/Hv35aogGMUFfBP/UeFqhL+KM3jvcHRFSTjxU/lhcpvksEaxWDOAm2aPJBFrnn
	qh6c7twGkuhP8lmW7miTobish5RFaAeBgwieboYBWzE27Mq7NBb36zR+6ha1wetA02Sk/rpXCc8+v
	Iyt11IRHAB4qQR/cPiC2jOqu6gu4Vac8iOJYgbMo+eJW/TxBphwWCaCYAk7A4G0dBZVfPSck7cjr/
	LceGnKToj9wdjiiU9GhsT+fXYbmyEyKoGiyfxmftKN9ti0Hf9z99Ae7V0hvjJ+26oSUMI16gbCtwu
	JxOnFDMQ==;
Received: from ip6-localhost ([::1]:27154 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1poTQY-002MKX-4S; Mon, 17 Apr 2023 18:18:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33068) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1poTQT-002MJ8-0j
 for samba-technical@lists.samba.org; Mon, 17 Apr 2023 18:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=cmgTDdB+c1ObYWFjPtgDTfFMPeMWnaJfuC5QSLBrrv0=; b=GIM4sX6ObM6P7NRbyiLaknufnB
 wmEcsiSpli2dYreDdj7qKvcd3gWdEAI5E6skahggnot3YXzDgwv8dJCK/Gi11As2msdEWDW0n5T4e
 iwBGE1IyhXFTKNQZlN+lwXNwQLXQTVs4U33lRItxSwUGol3MjyS2+lA27NFrPo1/v6MyZLM6/0Fso
 PKuy7tHGdBfHY4s3WhOHdogH7DH4pT099CNHFrNWynQ9FqJuzRZDR4SkV35EdqvVbcoKOT1TVNHyf
 C6IWfuPNann8uEGy1N6xU+DBPpO3ngEy85pAN/eLqmkrIrAcf1HRPB8uqX1ZjpEVqQNm/ErEMZuMU
 rdLnAxDzo/4hQQjJIOJdImvY0U/52L/cyo+QSPeJosHgxQicgWMYMOK5hV9XTzR2VhmJwIekXLzKs
 N1MPjsNBc78ePNB1w2j5mM8PHN92WU/4Sz3R/AtteEOqacihJrDnkkI8e42bvaAj4P0lc/sQ7hazQ
 qb/gAINhJ87ixN7LCcyRxFIz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1poTQS-001gdT-QJ; Mon, 17 Apr 2023 18:18:04 +0000
To: samba-technical@lists.samba.org
Subject: Re: talloc vs malloc speed
Date: Mon, 17 Apr 2023 20:18:04 +0200
Message-ID: <5829842.MhkbZ0Pkbq@magrathea>
In-Reply-To: <87o7nmhils.fsf@oldenburg.str.redhat.com>
References: <3161922.5fSG56mABF@magrathea> <4829322.31r3eYUQgx@magrathea>
 <87o7nmhils.fsf@oldenburg.str.redhat.com>
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 17 April 2023 13:07:59 CEST Florian Weimer via samba-technical 
wrote:
> * Andreas Schneider:
> > Yes, we have support for destructor callbacks. Can you point me to the
> > attributes which might help talloc?
> 
> I think of those listed here
> 
>   <https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html>
> 
> alloc_align, alloc_size, malloc, nothrow, returns_nonnull are relevant,
> but not all them might be appropriate due to the way talloc works.

I've started to look into them, thanks!

The returns_nonnull did recognizable improvements to talloc pool().
Using alloc_size leads to a lot of reports. As soon we access the talloc 
header it detects out of bounds access :-)

The malloc attribute can be set to a few functions, that helps. I use the 
attribute with the deallocator to avoid issue on free with destructors.

The documentation for nothrow is a bit short. What is an exception in C?


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



