Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B02E83F9F8
	for <lists+samba-technical@lfdr.de>; Sun, 28 Jan 2024 22:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=7TDvxP7uAEW31xb6pQoTYot/vEW81a684K5Cxxk+vFg=; b=Gveg2/hwIQGAYbdPX9aSDpisTC
	xDwMhvlAPVuLU1+LLkASoEN7fedC5mcQx13GNPAlgYQ8h1dcGiYF8yY+mIRuCPamSOt5rfYTop6BT
	2tLEO54p9XfvPfb+XEyT0umJn6Ts3RVpeB2SsqfQjaj27eE5BHt8a40MNsepOnu5AZ7Esgtuj79it
	IYoQ0kKeXAN7soToJlYY3WmxFEB5m0qDi/lFFHI7oLHM3VLO0OO6z63UzGH/C0ySufGNSUqd0wuJj
	0Ef/A0oxaLTPTnGZFvTFm1JReLKKueilrwCxkhXX5iifnP4HW8xDhRz7QdYltva0C1P56T9v6ve4d
	WQBYE+Xw==;
Received: from ip6-localhost ([::1]:23960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rUCJ5-004onc-9q; Sun, 28 Jan 2024 21:03:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35088) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUCJ0-004onV-A4
 for samba-technical@lists.samba.org; Sun, 28 Jan 2024 21:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=6NbGI+k2kmMdeXW/1WFaIaPmoMAcnThYj5NjXcO5yhg=; b=VhV2LsjTJqUX/cNx6Nt5Y/qi9Q
 2XnhDPMPWxIboECaTlGtIZMMPJrQ0ShWpa4sUJS5kXsE+6s1OfAkN0wq5LHWRw+txd/Q17D2J9hfx
 w6XNjIUtfVb4o8PBA0bvx08k5H7Nua9cFsOAZYswRuN3qkPeDhzJ1EKb0DwPMtknxiNhzWM+AKXqU
 meoImWo8VMRy+TjRggyHon1nFAjm3UwQ01h7o5KAgXCbk2iEwU3jkx8SkKqU/d0+b5A377ZPyp+jd
 nui8wRBwcoSW3er6N8yeI6cp7hG/5wTvnPJD/ovxmkh60vbDLhgaSDd4ihTTnpVYyGlBvvwZnslr1
 /GEuDXeLh7qwaigxMzjhZD/wmEUqCVIVD3iVpkazmp+QtxvdnwcgRdp6weEQj8vF6tbe81w8qqOr/
 p/6X7TMGYprx2LuCUxzj1Yi7oMe5wxJ+K4i+izbe0pqa/MzKeIxL0ByeiIrBZm6AQ8r1eACyUWQkS
 Gcg7rQ4EOII3gVcNugBXEz1P;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUCIy-00AFJI-1X; Sun, 28 Jan 2024 21:03:05 +0000
Message-ID: <38fa2c8184f9ec38055f42a5741cbc6f3c5f78ee.camel@samba.org>
Subject: Re: Some notes on "Implement 'update keytab' for winbind and tools"
To: Stefan Metzmacher <metze@samba.org>, Pavel Filipensky
 <pfilipensky@samba.org>
Date: Mon, 29 Jan 2024 10:02:58 +1300
In-Reply-To: <927cca4b-0409-4999-ac1f-1966266e65aa@samba.org>
References: <731186894254eececaadb25c14ed49d1aee4a145.camel@samba.org>
 <927cca4b-0409-4999-ac1f-1966266e65aa@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2024-01-10 at 12:50 +0100, Stefan Metzmacher wrote:
> Hi Andrew,
> > For some reason this felt better as a mailing list post than just a
> > MRupdate.
> > I'm really sorry to give a chunky bit of feedback right as I go
> > onleave, I'm sure is quite frustrating and you will probably want
> > someclarification.
> > Sadly I hadn't been paying attention to
> > https://gitlab.com/samba-team/samba/-/merge_requests/1999
> > 
> > As Christmas is next week, I'll be stepping away from Samba mail
> > andGitLab.
> > I do trust metze to continue to give you good feedback if you want
> > topush this through while I've stepped away - please don't write me
> > downas blocking this - but I'm also keen to try and help get a good
> > 'updatekeytab for other things' solution for all of Samba, using
> > our keys orgMSA keys.
> 
> While this sounds very interesting we still need ways toexport
> keytabs for our things like sshd, that also needsthe 'host/' service
> principal.
> And at least my main goal with MR 1999 is thatwe no longer need to
> mess with 'kerberos method' and preventwinbindd from changing the
> password every week.

<snip>
> But the basic infrastructure for an admin to controlhow keytabs are
> updated is a clear win over the messwe currently have. My hope is
> also to remove quitesome old code...

Thanks for writing back.  This sounds like a good and useful plan.
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
