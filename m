Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC05F6CFAFB
	for <lists+samba-technical@lfdr.de>; Thu, 30 Mar 2023 07:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=JzA+blOmzyJJ3lbehykXxYoD38BaHamytNkkLNEWnXE=; b=nBT6+Vz/z4fkuvKE7HqlxwO6fv
	S9eRjx67ZrZOF01qVKqhlRVompUIkPS0C+Tofb9/4xLtYqwmgJMAaDoPIzuKx6aLPIudULXuoTlfH
	Mo/y1+p4n9aHAnkx2ISSkQ8c/Cwk8m6+F8VmxDf5tTvh+S+z3zjxWhadWe8whrFpjzPL7e7E6dzis
	1VNss71p7Np8sNARKJeY4nosW1kBvk1KNCYzvIXbzVbZEVgjUXhkbu/OARnTAzUJwt/wu1BXDsWQ0
	cFaRkwoZHiQJsFVhrT/3t+RjIfdRc5y06JUOxNgDGFLv6Mm+UoJLE+o0gOzGHG7gJ4dZYvJPKCBsr
	5T6uVpRg==;
Received: from ip6-localhost ([::1]:32828 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1phlF5-005lFy-4q; Thu, 30 Mar 2023 05:54:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55132) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1phlF0-005lFp-9g
 for samba-technical@lists.samba.org; Thu, 30 Mar 2023 05:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=JzA+blOmzyJJ3lbehykXxYoD38BaHamytNkkLNEWnXE=; b=1TD/1A9G1VoPimjyMUmYVJMgvu
 3Z2YiutZt6TAQQCQkGt3uqd8NNAPS2ZJoYbF/Rrgp95Xaw/2ipKKYSFGpMty35g9PnrLg03/OBr5G
 AJShd3bg9u83vAVAMKU/ZafPPgZ9LxAefQ90azRcrKF3aMeuP5IaATuPBmtU9hp7XM7cjemFnrKos
 JQEjY4a1KYhlP4KRF1X5lBqXkBiKYV1HDgPQ3rTpem5vZyuucwvheMui38Wh9h3uXPTpgGpZ/nTZy
 Iluhk8MKPrTlesGjkmSFQDWN4iF6eG3uXAKRlDKIUsGDe9CFyPQ9DECM//MVqNx1zZcYY1mqavBRf
 fW/A2kY3UlwHb8CghfWVu5xYscmGv5qMGoXqHfmdnyVHLylDVgeeSgDtfWhXqgPwRU27iT8/3QDCG
 2picBkXf9a1FexrEmddTIQ3mBi7DONTgu3XK5k6qCGVWDTPwuxgv9v2S0EerQ7ZpjpsdQVa86BBeS
 e1KuXGWL2Rdh8ZOB4vPeDbPZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1phlEz-006CsS-67; Thu, 30 Mar 2023 05:54:29 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: smbget cmdline interface
Date: Thu, 30 Mar 2023 07:54:28 +0200
Message-ID: <8213814.T7Z3S40VBb@magrathea>
In-Reply-To: <ZCRztf6+I7s3tiYw@jeremy-acer>
References: <4486220.LvFx2qVVIh@magrathea> <ZCRztf6+I7s3tiYw@jeremy-acer>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 29 March 2023 19:21:57 CEST Jeremy Allison wrote:
> On Wed, Mar 29, 2023 at 09:45:39AM +0200, Andreas Schneider via samba-
technical wrote:
> >Hi,
> >
> >our smbget utility doesn't use the the common command line parser. It
> >implemented an interface on its own. So it wasn't able to parse UPNs or
> >DOMAIN/user correctly.
> >
> >I've fixed it with:
> >https://gitlab.com/samba-team/samba/-/merge_requests/3005
> >
> >However the question is if it should use the common command line parser. It
> >would break the command line interface as several short options are already
> >taken by the common command line parser and we could only provide the long
> >names for those.
> 
> +1 from me on moving to the common command line parser
> for future Samba releases. smbget isn't widely used,
> so as long as we make the changes clear in the release
> notes I'd rather move away from custom parsing code.

If nobody disagrees, then I would first fix the issue with the above MR as 
those patches can be backported.

Then I will move it to the common command line parser for Samba next.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



