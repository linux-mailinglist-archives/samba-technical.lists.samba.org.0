Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4790AFD28B
	for <lists+samba-technical@lfdr.de>; Fri, 15 Nov 2019 02:44:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=/XrEBtPZIGwr7fpK+M9saEBQhxll5EHcA8WVUeVzGSI=; b=VXyYaJLhINyYL2nOnnMefXuT0Q
	G/QSH3B0ml7Gq2RguyhNAMCWsduM3WnV1puOtLEQ/aqJALeFSatCZW5jac/fUhi6f++AGLm5UMZ+R
	mX0Me+LbtBm7xVGztTu0MjGlQM5W4ECtA0hNo6EKOpGmx6nJEHIsF5+LC5ib2iBsrMVpcBBXGMJSN
	lgKv6WvBjiadzPof6WI2u4RK+kyQ1MdJy60LSQqN45cUzlQBpJZrs6hh+hmk+iwtiJZXUvs8gBO27
	msBeX7wBRLVmnoTw84FMjdF41EZ/qmCCPLSQJw1ZGpl+o46rA+sZ9UzMT3iTBVe9PBzuapbEp7x4T
	JTaZKT1A==;
Received: from localhost ([::1]:58976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iVQet-000le0-CH; Fri, 15 Nov 2019 01:44:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24878) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iVQeg-000lda-Vy
 for samba-technical@lists.samba.org; Fri, 15 Nov 2019 01:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=/XrEBtPZIGwr7fpK+M9saEBQhxll5EHcA8WVUeVzGSI=; b=LKtex+y1hSGyIrOSFof1Sf/MXp
 uWbUaaFLuVDMLBRS2bKUjQvuUBRJtn4pJRiBOXcvxyDM8PdXYpnitqKM2xCGtMFtRdhW9vEPuE0jV
 rd1lzfjEmuhFAQLP06yfvQnE7j9MSB5KX+z7euZGGxDyGrnIsWIMPv6UJm0miUnvZPmWVyHkdxjto
 r6zpArdb+orj258fS9uHGNgUCUjnizH+kauoQKwedH1qO14umBPyeDyh2XncpyDmPdrdsQ0CRYvBX
 f+koayzMLO4NL/QumKCsS7ZyDTZvmgD4gX5nGcJvl0E0W0zT7mdwOKDmU6yMjcFzbMi0JNYCiOD3L
 gw0/yuX7k6MIUWX19AL/weUkJgU4VvkO0l5t47JaO7g5ehXDFBsp1/bufzmtdlom00hfCmuIU9i9i
 aS4UT7pLcWONaPEtkcjYbXJKQ735/3tFj835B87Xm+9DBwJVVXUMtAkfYKqcvBFtT9qbl2rWcE/Ms
 HP3ly6rhgaQg6O73HbZg08HJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iVQef-00046p-7y
 for samba-technical@lists.samba.org; Fri, 15 Nov 2019 01:44:09 +0000
Message-ID: <be7bbeaf95255d088662f2ecd7b9fef3530cd056.camel@samba.org>
Subject: Re: Samba smaller: 10.4mb smbd
To: samba-technical@lists.samba.org
Date: Fri, 15 Nov 2019 14:44:06 +1300
In-Reply-To: <fef7a4b511a770b14bbcb2f169b3f424133d03cc.camel@samba.org>
References: <1485773517.15997.35.camel@samba.org>
 <fef7a4b511a770b14bbcb2f169b3f424133d03cc.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

On Fri, 2019-11-15 at 14:34 +1300, Andrew Bartlett via samba-technical
wrote:
> For some reason I had another go at this, and have things down to
> 11.1MB.
> 
> This is NOT FOR PRODUCTION USE, because I have to cut out some
> important things, but the idea is to prove that by reducing the
> linkage
> to the ndr-table subsystem, we can avoid bringing in unused code to
> eg
> parse drsuapi.
> 
> Anyone wanting to take this further will need to work out how to get
> the appropriate interface tables for the specific pipes we need to
> use
> internally.  It would also be very worthwhile working to understand
> why
> we depend on what is left, and seeing if we can trim that some more. 
> 
> I used:

By not building all the modules, I was able to reduce it to 10.4mb.

CFLAGS="-DSAMBA_SMALLER -O2 -flto -fwhole-program " LDFLAGS="-O2 -flto
-fwhole-program " ./configure --bundled-
libraries=talloc,tdb,pytdb,ldb,pyldb,tevent,pytevent --with-static-
modules='!FORCED' --with-shared-modules='!FORCED' --nonshared-
binary=smbtorture,smbd/smbd --with-system-mitkrb5 --without-ad-dc --
without-ads --disable-python && ./buildtools/bin/waf --
targets=smbd/smbd

If any vendors wish to work with me to make this production, so that
they can upgrade to a modern Samba version in constrained environments,
please do be in touch, as I would be very glad to work with you!

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba






