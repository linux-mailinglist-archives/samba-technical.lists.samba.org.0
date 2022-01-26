Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A6E49D04F
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jan 2022 18:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=QdFqESuKHpfboF1xTKQYb9zXyv73OgMGYefyY+1yBJs=; b=gKW+mV9FiAZv7QhfgjSSJlMqrC
	FNsMK0K8k8ZPS92eXYux3FoXwymsXiNpqJOkyBBHaENWm1nqFEEnZwvDlnKK7q89/fzsc47WY2cwH
	cvpVrk+9Y0gUcbLOukKlqbv+9pMvbZY/Eep9ORvTGcHqGE4XqbPF/Wt582wdPDdYIHDtAmEHC/a7U
	SESJWdLqhUvjeI2E2woV+fqa3Z7qvtzGiz64pirnvtMYGR7HXqaHDcgzv8UxKCDH6exhfTNYJlHGS
	vsbptdhUXzffCUcpjv4ThqxLms20JEr5tydR3+VR5b+z9S7/8dPIpxAQDx5VimMNgDG9JWc2+gUxv
	vAgfzE9w==;
Received: from ip6-localhost ([::1]:62276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nClhx-0017nj-9e; Wed, 26 Jan 2022 17:03:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48380) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nClhr-0017nV-Pv; Wed, 26 Jan 2022 17:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=QdFqESuKHpfboF1xTKQYb9zXyv73OgMGYefyY+1yBJs=; b=Moh7juzmaEaBESUqwe9YDskCjj
 qPQ90zMPbOHlFqJbGbmwOQnUo5jkvZjJctj9aIQNMpmIE16g5ef+DRfsbDgAweKFYKPhK3sGE1zLv
 lms6yUyS0wTgrx2uaG+G5jhOAa393HHrcHnMiW1L/kuT0QPuW2qo2ChudMH8NfqRc9l/1Vr9ZIrS3
 TQsf3Ur3t2QLD+nKCzHwKjCb/MXBsJa/gS7UKVLZpdqhk3OyMj5zro4hrcfljN1jdaFF2tvCCvp+u
 oqZiY9g+LxrPzaoz9cBvmh2dZNlQhchnT+nVW0p72ipzWwwyMnXfUd2uqhLgCsTCVhEgv1wBEA85p
 3yV4pqMdk2S8r7qPChIM7kbS+JoFG5Jv4AlSNOU+zr/dakTmO0fPjf+lSjfnXoFvRktDz0yJjYv4e
 mPRtqKMTJWuJWI749PLoqJOLo2wpOkiBN0q6YfG6zisUMbEbBERWPLqDp6pt1yZn81wmXlrsoJdWu
 j/TCrYKgsQ0MnnHIkIK78wrW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nClhq-000k5d-Um; Wed, 26 Jan 2022 17:03:39 +0000
Message-ID: <645a4d5694412fcede14754955d7d1ef8d4b3941.camel@samba.org>
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 samba@lists.samba.org
Date: Wed, 26 Jan 2022 17:03:38 +0000
In-Reply-To: <YfF8+OMLV0UkzicQ@jeremy-acer>
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <20220126115058.GA936420@sernet.de> <YfF8+OMLV0UkzicQ@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2022-01-26 at 08:55 -0800, Jeremy Allison via samba-technical
wrote:
> On Wed, Jan 26, 2022 at 12:50:58PM +0100, Björn JACKE via samba
> wrote:
> > On 2022-01-26 at 16:50 +1300 Andrew Bartlett via samba sent off:
> > > My feeling is that for the Win9X and OS/2 irrilplacable
> > > industrial
> > > equipment case, that guest authentication would suffice, combined
> > > with
> > > 'force user' and 'hosts allow' for 'security'.
> > > 
> > > What do folks think?
> > 
> > my gut feeling is that many users will be very unhappy with such a
> > change. I
> > know many setups where the clients say that ntlm auth is still
> > required for
> > them and where guest auth would not be an option. Even on AD DCs
> > sometimes. For
> > sure on member servers.
> 
> Correct me if I'm wrong Andrew, but I think Andrew is not
> thinking about removing NTLM, but only the storage of
> LM password hashes.
> 
>  From the "lanman auth" section of the man page:
> 
> This parameter has been deprecated since Samba 4.11 and
> support for LanMan (as distinct from NTLM, NTLMv2 or Kerberos
> authentication) will be removed in a future Samba release.
> 
> Removing the LM password hashes gets a hearty thumbs-up
> from me :-).
> 
> But I may be miss-reading the original message. Sorry
> if I'm just adding to the confusion :-).

I must be confused as well then, because that is exactly how I read it,
just remove the hashes :-)

Rowland



