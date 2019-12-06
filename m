Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DC5115659
	for <lists+samba-technical@lfdr.de>; Fri,  6 Dec 2019 18:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=06ApTSF8vnA8He++K5LZbylJXIB/lU6JBBeN6qGb5s8=; b=si5ZHFoixCL0demUk/c8F4aPMj
	C5bJTlsRCO8ISWTSUnmif/30G0bqKMc/aBgSbZZ6kb5GtIZP6y+q6OI5VhDH4Pj0L+xnJ0M46QN39
	n3GM82lH9RLqO/JF9cL9hAjgh2beGquML0XDAIiwXMxVq85hynJyiot3r25BIyRNo6mLDKR7iXocs
	al46eQYAPv+iUvjnAEURZa+UE9Gt/eSRXZ55HUeVaMyU3ohEOISP0Mk+X85zU8vPeFnJF9wSNNeBy
	ePL5QWakbv0WD5C9HgjO7MY+wEhD0VhtSfJ1sYii1LpQBj92tabSTcPPebAFxPcJGzR0yFx6RC/jQ
	f39k8q1w==;
Received: from localhost ([::1]:33222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1idHK1-006RLM-SM; Fri, 06 Dec 2019 17:23:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1idHJx-006RLE-WC
 for samba-technical@lists.samba.org; Fri, 06 Dec 2019 17:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=06ApTSF8vnA8He++K5LZbylJXIB/lU6JBBeN6qGb5s8=; b=iCixh1PV/pv9HLKkXrO5YKlt/g
 1zJ31CrT/sYkuqq8QIg5MwEPxf0bHtuB5BUyxi1gmcbX/BjhHDQq38WOjuBi22qobZJqBsQRLcyro
 DHppbMgZG84XfR7X5nuXSIbiGN0HmmrxX5T9/PPIxcBC5nwQATRhVd4slCdBjyX5NdEAGH7RRrPkh
 nrwu2Tm4q31Er44f6zdE0sVBSXLdxNtGzxUXS7swFvS3AMKjOHYaZ9EGW3qToWDK/dgyEBZwDYGEN
 QiASqYdeBnWMTaJRForJy68EHxXI5MbYWbIekRe8Alb0QORfBhJmRYm1hbk3hNYsWwF3/qKOv7xP6
 sPO6aPOjO/mURP/DB44f7s7h4HQq49kCQO3ZeBKRjGKTZyWlW2IqEPczx/PAzLqVCUnT2RlqcYw1q
 Nc3IZp1EGcmCasJbg7lNpST27xsEn1E0IczqR8cvcUK9JQO/yc3AJhUhqW5vTsJa7OJ9CNQgKi7yd
 4UvN8J0Th40FrdUHQ5uxvb4D;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1idHJs-00020x-EH; Fri, 06 Dec 2019 17:23:08 +0000
Date: Fri, 6 Dec 2019 09:23:06 -0800
To: Steve French <smfrench@gmail.com>
Subject: Re: Control fields in Security Descriptor
Message-ID: <20191206172306.GC16790@jra4>
References: <CAH2r5mve-AG26FVNQRZLPO5pqgkGLDkqN9xQ2=hh90_QzUWHAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2r5mve-AG26FVNQRZLPO5pqgkGLDkqN9xQ2=hh90_QzUWHAw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 06, 2019 at 11:14:43AM -0600, Steve French via samba-technical wrote:
> I noticed a Samba server bug when I was debugging a problem in a
> client patch I was testing.  The client patch was sending the
> incorrect (endian reversed) Control flags in the security descriptor I
> was sending to Samba on create.

> I noticed that Windows server correctly rejected it, but Samba server
> accepted the security descriptor with the incorrect (endian reversed)
> Control field.   Probably Samba server bug to ignore validation of the
> Control flags in the SD.

Can you give an example of what you were sending when incorrect and
when correct please. That'll help track this down / allow tests to
be written.

Cheers,

Jeremy.

