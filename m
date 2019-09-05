Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C08D9AA0A3
	for <lists+samba-technical@lfdr.de>; Thu,  5 Sep 2019 12:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=VyTuY2Tshv92vwN5twqSemeE3gAA2jjI/Mr1wCwmq28=; b=ZADtBKqtB9mfKlfe1LA9j+F18A
	Ffxe583hsOpa58a/FhEhozpNalW1pvtRTcZLacs7ysUFA6kkSTFQZyBbqCHix7GnTUcAWOm2O78Vv
	k//jftsKb+FTc2F6EEGK1nJ6cxu6U6h+ppANDesUGpfBVv3nA0McNPmjAnEnHOebhzfarQgD2u0v0
	GU7BQzbSSy1aatsKmSzxvofSszWyznIz4yBEiw/d1GI64LwZvhuAzW0etosBcJmVJPNodrvwQXnWP
	Nhg/6sQjibVBon/hj78A0M0O5isUgfr6UYcuOol+QuzrMXMxvRSEf+cqbfeCziKjuzWwBzCaLKvjn
	quFhzbuA==;
Received: from localhost ([::1]:59962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5pRR-003eLR-Sp; Thu, 05 Sep 2019 10:56:41 +0000
Received: from mx1.redhat.com ([209.132.183.28]:47850) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i5pRM-003eLK-TW
 for samba-technical@lists.samba.org; Thu, 05 Sep 2019 10:56:39 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5493190C022;
 Thu,  5 Sep 2019 10:56:31 +0000 (UTC)
Received: from 10.4.128.1 (unknown [10.40.3.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A6A55D712;
 Thu,  5 Sep 2019 10:56:30 +0000 (UTC)
Date: Thu, 5 Sep 2019 12:56:28 +0200
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: [Announce] Samba 4.11.0rc3 Available for Download
Message-ID: <20190905105628.GA3317305@10.4.128.1>
References: <E99FB72BA8824B0FAB212FAE35B48FCC@rotterdam.bazuin.nl>
 <vmime.5d6f80b4.1e1b.6bb54cec4bcd19f4@ms249-lin-003.rotterdam.bazuin.nl>
 <f22b0ebb-ffd1-0cca-60f7-81622ace6ad6@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f22b0ebb-ffd1-0cca-60f7-81622ace6ad6@samba.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Thu, 05 Sep 2019 10:56:32 +0000 (UTC)
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
From: Lukas Slebodnik via samba-technical <samba-technical@lists.samba.org>
Reply-To: Lukas Slebodnik <lslebodn@fedoraproject.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On (04/09/19 11:17), Stefan Metzmacher via samba-technical wrote:
>Am 04.09.19 um 11:15 schrieb L.P.H. van Belle via samba-technical:
>> Hai,
>> 
>> Check again. 
>> I see 2.3.0 is uploaded. 
>
>I'll do tevent-0.10.1 in the next hours.
>

Thank you very much.

LS

