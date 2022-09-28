Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B2E5EE5D9
	for <lists+samba-technical@lfdr.de>; Wed, 28 Sep 2022 21:41:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=oqfpW9l5hd1yNNSMt/CokHEajeOaG4OHSCjt6hcqT7k=; b=YVjLjs1Oh9ivqn2Nx+8enS204n
	a9ep/s4WHYBmHSOJh9iUcVeEd0DVZ4DlwA7sc9pvW8mEbNLc6lPBz4YJwCR/8qnLHjF0jV+jvE95M
	BXN9j7l/Ao+Rtny6CqzcSP1Djd35WMRVte9tCRmwzL/t1frXauJp2QTs6nqcCSujXz8m3Qe1cZpHH
	OAMxXMbs7FXRE8shP+zlFholmvXxiXdv9OKbgtAynkqS/MJUc+6jNk/RMA5SuoFJy6hHj4Mx+cbrk
	33xsLIigsU4P8PR5vx2a3hZm+ikAKsRryG3NlwtHo1X9lbd2ZJrnJPWxG70G+gO0Dny4Ky3o0Qf+y
	WIPT7NnQ==;
Received: from ip6-localhost ([::1]:46890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odcvq-004h5K-OS; Wed, 28 Sep 2022 19:41:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35446) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1odcvl-004h5B-OQ
 for samba-technical@lists.samba.org; Wed, 28 Sep 2022 19:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ShGI8QksNpAVyJJS635PETCU5Ddkryu9n5ofUx6HMxk=; b=LVGAauccMYhAUm7ndlcj5k/gb7
 sc8fCpHOzrw/iha/5iNv5pDn2E6dTBKnGU7OplVjx72DMJ8ES+smS3iAO652vfFLcNrNLvf9tozR+
 7cGrw4WeHUsebvYw3LN+7Meo9nr9n8Ps7rHFaaZtL539ID9DqWYG5KUxfAo0DIIMCaEt+DfuOwLyo
 xdPqtcLeKF2sLeBYsV5chevh2it9wI9Y+4z0dtGw2Xv30LLw2qlV2NKAXEkr77Sd2GJSWFAMD6h0N
 1hEyU6d0Cip86HAYr/Gxiw8ELF6tBbXgo1xm1wekCyXb3GvwjezHBNAh7fz/yX22/63SLmXOhbs4v
 cqvep6fJ/8TlcSq7vsdt8Sj9veipgE7ScAptgTomq9Smc9TsBDQNidisFuxj4mmUPzOUxGkCwZlba
 GQyWUUqqfTGIhGHe6uy2xuYVlXKkPVy2m5qpJdeZKyaxgZzsdErUHa3oOPg2IkRIzn/AFqHIYbZrc
 19UStpbBaMtyEXFj72HTrcAF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1odcvk-002Gbq-5k; Wed, 28 Sep 2022 19:41:17 +0000
Message-ID: <0fde629b5f7db5ffc732f8f8f1b5746ae0f76143.camel@samba.org>
Subject: Re: buggy krb5 ccache behavior and cmocka unit tests
To: Christian Merten <christian@merten.dev>, samba-technical@lists.samba.org
Date: Thu, 29 Sep 2022 08:41:10 +1300
In-Reply-To: <742fcb2c-69d2-235b-91c1-a188f0b9a90f@merten.dev>
References: <adaa5aab-92d5-019d-f86e-969938cb5788@merten.dev>
 <c7c6a7091ea929b2937ea41c5b07d37439277571.camel@samba.org>
 <742fcb2c-69d2-235b-91c1-a188f0b9a90f@merten.dev>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Wed, 2022-09-28 at 21:31 +0200, Christian Merten via samba-technical 
wrote:
> On 9/28/22 19:54, Andrew Bartlett via samba-technical wrote:
> > DIR and KEYRING are implemented in MIT Kerberos, if you are
> > runningSamba as an AD DC then you will most likely have Samba built
> > with ourbundled Heimdal Kerberos.
> Ah my bad. How about introducing a check that throws a descriptive
> error message if therequested ccache type is not supported?

Patches towards this are most welcome :-)
https://wiki.samba.org/index.php/Contribute id="-x-evo-selection-start-marker">
Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
Samba Development and Support, Catalyst IT - Expert Open SourceSolutions
