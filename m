Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A61275E8594
	for <lists+samba-technical@lfdr.de>; Sat, 24 Sep 2022 00:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/hutZPNmiLwR9/dnYL+PzaBO0Kg3IudPxkril+8NgWg=; b=QuqMYTPVYrt9ktOpTQ/BjAZCw9
	q7P09lTLxHm3h6IvqKI7L+lO3P01GQxcAK4+IF4DehX+Mat0U1JQesCj1D7XAa4rT9yY9AJq7JdRd
	2i22sPy3vuIZWY94ZhH9YqvAFq3S5XjdtT+VIivu7tQ+ve2UtwV4lHKJW0k/GgDMXj2K09foDCz/i
	scQd8MYnjzKjnPDt2Z5itYJdAhPvTWVvhaiFRgXouqeLYPiww7N3gjApo5gwB1aKQcupAbHqZz/Yf
	8vEWtoCGfzI0C3VJVoqgSMwgRHq6Sm+CmqIdMzK3dr5u/7yypP7QGxOwAa095nzqVug2ZPspQrO3W
	89cd9ieQ==;
Received: from ip6-localhost ([::1]:23008 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1obqr5-003kdr-5r; Fri, 23 Sep 2022 22:09:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28550) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1obqqz-003kdh-UU
 for samba-technical@lists.samba.org; Fri, 23 Sep 2022 22:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=/hutZPNmiLwR9/dnYL+PzaBO0Kg3IudPxkril+8NgWg=; b=hdf+qzZAhqQ+qhuqCwK+yDy8Bj
 YPMMGmOD/rbeMQ2eN+Vu6GHrGVp5gIVYiA4bvjZPvr6PAWteDdX/8eK+vVLjo8r4B6/CakLBmrUkN
 1ZwBRB84duUletwxT75UEGnsSNclJkDcBnMz2nyQOaSBOaZboRE3u9dA2EVKIA18+TyelCD5+K08u
 haY5z1roX9Ul0nyryaCH61Bp+AoTj9jlq/63P/Gx9U3udzpCXKj6EGYZy3ObdMA2O4/qEDdziNjXX
 8k+1tGXEijsqkxl/fCiw7iae9cP+LcypNtg1ESAuIdJ0+BWo8ILmf9zSMmo3SiRITd2k6fNiuwGwf
 W2Xi8n9fHW6cy2Rmt3te0iT1ckh2M4wPf33Afi1PCK4Mz9idPyWb9VSo5SVr4DcMDH4GOvDqrHKwf
 +/722jSuSJky9dmkWLn8GPAQfdye4AQDDEH4oi3Pme6BHGqZEgHLUUPFF/GV94938/Jq516IsYNUk
 3hTa6E/TuLGvj8QjUCjnE0wD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1obqqy-001fO7-Ml; Fri, 23 Sep 2022 22:09:01 +0000
Date: Fri, 23 Sep 2022 15:08:58 -0700
To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
Message-ID: <Yy4uev/AGxGDAJB4@jeremy-acer>
References: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
 <YyTdlsd2ExgX8U9r@jeremy-acer> <YyToAYaXsfopiTdh@jeremy-acer>
 <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
 <YyqQ9HtsTM2lmkQF@jeremy-acer> <Yys3/WVPd/gjBbEi@jeremy-acer>
 <CAPw4iV4AH7e4odCQ=xjzG-bAcr=5mGVPFA8qf18WBz8wun_SLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPw4iV4AH7e4odCQ=xjzG-bAcr=5mGVPFA8qf18WBz8wun_SLQ@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 23, 2022 at 06:00:50PM -0400, Nathaniel W. Turner wrote:
>   On Wed, Sep 21, 2022 at 12:12 PM Jeremy Allison <[1]jra@samba.org> wrote:
>
>     On Tue, Sep 20, 2022 at 09:20:04PM -0700, Jeremy Allison via
>     samba-technical wrote:
>     >Change the API for dsgetdcname() so the caller
>     >can specify if they want IPv6 or IPv4. Don't
>     >return more than one address - we don't want
>     >to double the lookup time for a down-DC.
>
>     Probably should be a 'bool ip_v6_only' parameter.
>     Only set it if the client has only IPv6 addresses
>     available.
>
>   Thank you very much for the pointers. I explored this approach a bit and
>   got as far as hacking
>   together [2]https://gitlab.com/nathanielwyliet/samba/-/commit/efcfe8f0380c44abd52082073b7c473c153caae3
>   However, I quickly realized that doesn't really work for all the use cases
>   I care about, as it puts a burden on the callers to set up smb.conf just
>   right. Pushing the complexity up the call stack doesn't feel like a great
>   solution, especially when most parts of samba already handle this scenario
>   correctly without special configuration.
>   My second attempt at hacking something together is
>   at [3]https://gitlab.com/nathanielwyliet/samba/-/merge_requests/1
>   n
>
>References
>
>   Visible links
>   1. mailto:jra@samba.org
>   2. https://gitlab.com/nathanielwyliet/samba/-/commit/efcfe8f0380c44abd52082073b7c473c153caae3
>   3. https://gitlab.com/nathanielwyliet/samba/-/merge_requests/1

I'm getting 404's on those links, sorry.

