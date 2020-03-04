Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C834178C8D
	for <lists+samba-technical@lfdr.de>; Wed,  4 Mar 2020 09:29:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=TlW4RUmFPKsmkENfoHN9PK6YmMU/tWuXcwF4AhVop3I=; b=3ZlFrlUVxXzW5SaQkptQ1iBqLd
	Zlu7YDndbdlUSGma+euvCCyud2cYNnp5YB65kwHpHHmbbzTPETl+CMZhJOzqD+ffVIVSzHu5hKeE9
	1uxGPK7kYQTMNhR+uRi++jjJJXpG40HYctW42Sjkh5HTCSc3Q6lZ6J6EcI4TB0+a53BwpZkB4gwzE
	iyTuYYUqyxVaZhkcjYi8kupu9bLpPa0eEGAi+Qaokov+AK29WqPwqawbQhhLjxuVmGWCwGI8ySEO4
	44tQpajis/6hILrCjevAqSTP9GVIqLxEYXM0g5KKVJBMXmbvE6sxQR/iqICgrWx+RAHo+CEBaymyn
	vYhc6IrA==;
Received: from localhost ([::1]:27078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9POi-00EtH1-95; Wed, 04 Mar 2020 08:28:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12928) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9POc-00EtGo-Ds
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 08:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=TlW4RUmFPKsmkENfoHN9PK6YmMU/tWuXcwF4AhVop3I=; b=dQFJdl4NzBeqjVcsw+8lz76nCi
 p+YJwKZ+x6P2vbe56SPpmyzXi0opRTH4bVtXq7uPojFkjHk2xTuvu2wB4Jk4CAvJSL8J2cJIxnZzl
 eycSKeggkx7BB854b6hH7ERTe8SUSLHWf8Xx161eSf6ET3ocuyZtEnjJ7/l45K/CxPpMfDW5un8bM
 3g1kTsdr8jFxwGehIc2J16Gp+r5qYKwOUYbXndKFzmgPxZ+SL2dQsZQGd8sCv6Mn4R2JSWYi+dSPg
 e3+609KYEJ915ZlYKy3XjjtmK6MfXFlLOepbpjODEsySIUcYeJLAEoQt1m/mmnYk6gW3fD/79gIXY
 uN4qgSSbl2KI9YK3t8812H33bhGq3o1Pm7Ro7VFru8S7n4Izts442Wn8E/SRTMQiZ/1DjsU1wXDFh
 wV/041gWaHy+rKwCzmB25DwdJe3j4NB4jcsCQTQNbt8cTZ/550+F8NxhyWfnfpEUo+O1nv7MLCiMA
 +1uXyHITkN16XDjTnc3faWSr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9POa-0005yK-Uv; Wed, 04 Mar 2020 08:28:49 +0000
Message-ID: <b5073005fab5aa04d68b32bfad94b4e32959a3e6.camel@samba.org>
Subject: Re: Getting seeds into oss-fuzz
To: Andreas Schneider <asn@samba.org>, gary@samba.org, 
 samba-technical@lists.samba.org
Date: Wed, 04 Mar 2020 21:28:43 +1300
In-Reply-To: <1687004.OyDMVEAEud@magrathea>
References: <49d4d99c814983f7f075a8d70c5030350bf30810.camel@samba.org>
 <1687004.OyDMVEAEud@magrathea>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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

On Wed, 2020-03-04 at 09:18 +0100, Andreas Schneider wrote:
> On Thursday, 27 February 2020 03:11:42 CET Andrew Bartlett via samba-technical 
> wrote:
> > G'Day Gary,
> > 
> > We discussed in person a long-delayed task for the fuzzing effort,
> > which is to provide oss-fuzz with good seeds for each of our fuzz
> > targets.  It would be awesome if you can slow-burn at this when you get
> > some cycles.
> 
> Thank you for working on fuzzing, but I get a mail every two days from oss-
> fuzz:
> 
> samba: Coverage build failure
> Friendly reminder that the the build is still failing.
> 
> 
> Maybe fix oss-fuzz first before extending it. I've sent a patch proposal 
> earlier form a very quick look.

I wrote back to you about that, and I'm confident it isn't the right
patch.  Perhaps for a short time it was (because oss-fuzz itself is
changing), but I see no issue with the actual build in the multiple
hours chasing it down.

As far as I can tell the reason for the coverage failure is a lack of
seeds, nothing else.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



