Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E5179397763
	for <lists+samba-technical@lfdr.de>; Tue,  1 Jun 2021 18:00:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5g/LMqu6Uk4V15tn8m6yzVTSPNdF40esgXSTvwmjOwk=; b=QLxscOiUrvqZOXkbj3OE2nwTXH
	p/C8C7Zqm3u1pJWD/mGRSuXVMr8jTM4OshnJnxjBfYzddeO3Y4jo7wB6ufJ/+QUg+L0BOsE29AbFT
	wL01YWMP+nA4PYhJZVG3kXOFx0B1+WeiCaDPjcNqqLiAMLnwKF+SVUTHptd+hzK/G9ebOE7dcBA20
	YaWLPKSk0a+OXg+0j8XzEwvBJ/eROPKnC3FKxmj/FXmEkrAX9zQ5ySVOcaHG7AGEmYGaHe9X2w/bj
	z1hOzb8qcw8IPvVO/g6+gsshn8jyOyzvtQhYb7oR0bIxje1BL5ulaKjQXT4ArsHVwoK4j8qvS9+dt
	4RaxfMnw==;
Received: from ip6-localhost ([::1]:25066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lo6nZ-002LKL-Ut; Tue, 01 Jun 2021 15:59:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61500) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lo6nV-002LJy-NT
 for samba-technical@lists.samba.org; Tue, 01 Jun 2021 15:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=5g/LMqu6Uk4V15tn8m6yzVTSPNdF40esgXSTvwmjOwk=; b=Hm5UzOU26cYq2Y2m0EqGgwAT0X
 P+JRh1xWnfOKIaIKqxsoDmqy5HWcWTrUEiD3X8Xaa2KTYL60HRQ2XmEUU+B2QKi+yu5fETyyJ4GIE
 nbolJu/cIZTVXH1fr3+RjQh18pchf2T+61W6d3XQ3TsutMfXgPoz+b3otgnh2uJ3sOY/6IglMeIR/
 Ih/fyBOdKp7HRcTMznPwUdy66DO02xUfZUXhGrOIPzhjdIey4jxt7dYN/gF/FCmHJTy/BIIqbS4pQ
 JjQ8wLfuK1b0whGdtdQV4J97cSJtrHfm4YCRbBgslkX0QfSObhrYXZ+OVg/dq5hCfznTGhsM83rnZ
 HDzHe8vK9pReZKYpTZ/VrKmOmcqzSVsyMlXhV0HAy9FARByPwtwfM4DqA539igFt3N00LZLdbwjKA
 9zOoeZpY7Kze+RijEBSvdG0UmLn/vRd3UEd0Z6Ya9kAxZRv7z6IzvSo71sPixAcuZSwdmZLeD6SmD
 tFK2YNFwTqh0noY3xjm2JU7d;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lo6nT-000852-M5; Tue, 01 Jun 2021 15:59:16 +0000
Date: Tue, 1 Jun 2021 08:59:11 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: JSON input / output for CLI utilities
Message-ID: <20210601155911.GA4152169@jeremy-acer>
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
 <562c85d7-c1d8-c978-6136-3ca538d12857@samba.org>
 <CAB5c7xqZ3OAB4YJDsU5tj9GAh+j4KiYUz_5wwOG1xeAkFcFH9g@mail.gmail.com>
 <54a0103bb925ebc76a6dd94829349adff7d94863.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <54a0103bb925ebc76a6dd94829349adff7d94863.camel@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 31, 2021 at 02:29:20PM +1200, Andrew Bartlett via samba-technical wrote:
>On Sun, 2021-05-30 at 21:14 -0400, Andrew Walker via samba-technical
>wrote:
>> On Fri, May 28, 2021 at 11:15 AM Ralph Boehme <slow@samba.org> wrote:
>>
>> > Am 27.05.21 um 23:42 schrieb Andrew Walker via samba-technical:
>> > > I know we've added JSON output to a few of the CLI utils. Over
>> > > the past
>> > > year or so I've added this to various utils in FreeNAS (using
>> > libjansson).
>> > > Is there an overall strategy for this? I'd be happy to upstream
>> > > what I
>> > have.
>> >
>> > I guess as what you have worked for FreeNAS/TrueNAS and unless it's
>> > somehow tailored to specific usecases, it should be good as is. :)
>> >
>> > > Also is there an effort to add support for JSON input to them?
>> >
>> > Not that I know of, but that sounds like a nice addition for some
>> > tools.
>> > For which tools do you have JSON input support?
>> >
>>
>> I'm in the process of adding support for pdbedit, net groupmap, and
>> net
>> conf. I see one of major advantages of JSON input support for some of
>> these
>> is we can trivially add support for batch operations. Libjansson is
>> quite
>> easy to work with for doing json input via json_loads().
>
>Cool.  I'm really excited to see this expanded.  It is awesome when an
>idea spreads beyond the original developer's narrow use case like this!

Yay ! Massive +1 for this ! Enabling scripting of these
things beyond writing bash will really help expand Samba
use into new environments.

