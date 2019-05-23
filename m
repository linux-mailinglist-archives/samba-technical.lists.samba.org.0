Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 116D228D9A
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 01:07:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Bh+ovhzdEVP67Vg/8o62NaiMYHoYL77GIEw9oxgHIEY=; b=ydgUoQJ2aoYeC/+mI9BMQRe6e3
	y0mpKBQ+U9v5hvqk3OPCpXKmOHZ07hK6WvK1k+8PPKQQDf3Ar500XZElRc/4JEzkLDHO86bM6xPXh
	P4v07oocivmKXtDzX4qUspqTac8YU7MJxifVytH7wcf6W6ByiYOmcKXMHBDvMkJTDe2op6qO6jvMJ
	Y8wjclgd3GpjB4YVGYKlXWK4OZRUIJqfgSQDh7IPqHIgjTpuRcln8CwhE09va/u8sOGQwQXsFlBv7
	gknmml3teYFYCOt4rd5TCZy6FU7MJVOWpGavgBrxXQRZrfxWfSi4MjA1OWTFLsO6oQN6LsOPjWoYV
	hJW8eyxA==;
Received: from localhost ([::1]:22392 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTwnp-001Uyq-9Q; Thu, 23 May 2019 23:07:13 +0000
Received: from [2a01:4f8:192:486::147:1] (port=60756 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTwnk-001Uyj-C8
 for samba-technical@lists.samba.org; Thu, 23 May 2019 23:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Bh+ovhzdEVP67Vg/8o62NaiMYHoYL77GIEw9oxgHIEY=; b=VRpMiOYM6MLDdVBcl/tTr+137+
 zYfxf3/3Aj8XXUlTP4DcHV94/5KMOEoMDuSYN0dq/BlQXXjxxOiZlaR3xw2KaAItty6bqreX5rA0A
 kxAzMkAdmG/OZK+NZU8QqkSZNP8AAjvcNJJCwg78Z7BSz/UFf08G4OPQ5n5umcRQrkL0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hTwnd-00048a-D4; Thu, 23 May 2019 23:07:01 +0000
Date: Thu, 23 May 2019 16:06:58 -0700
To: Tom Talpey <ttalpey@microsoft.com>
Subject: Re: [PATCH][SMB3] Add missing defines for new negotiate contexts
Message-ID: <20190523230658.GH244578@jra4>
References: <CAH2r5mvEYMEUjz8BDRUumn0yGq__VntNKx-8AzWcZgCDOJQv-Q@mail.gmail.com>
 <20190418172353.GB236057@jra4>
 <BN8PR21MB11863B736AA5D284CC213118A0220@BN8PR21MB1186.namprd21.prod.outlook.com>
 <CY4PR21MB0149DC81B079BCD36D580AC5A0350@CY4PR21MB0149.namprd21.prod.outlook.com>
 <4591362b-cb4e-7e22-00a6-bf7239584957@samba.org>
 <CY4PR21MB014907F825DED7F5057E69E2A0010@CY4PR21MB0149.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY4PR21MB014907F825DED7F5057E69E2A0010@CY4PR21MB0149.namprd21.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: Stefan Metzmacher <metze@samba.org>, Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 23, 2019 at 06:24:16PM +0000, Tom Talpey via samba-technical wrote:
> > -----Original Message-----
> > From: Stefan Metzmacher <metze@samba.org>
> > Sent: Thursday, May 23, 2019 9:51 AM
> > To: Tom Talpey <ttalpey@microsoft.com>; Jeremy Allison <jra@samba.org>;
> > Steve French <smfrench@gmail.com>
> > Cc: CIFS <linux-cifs@vger.kernel.org>; samba-technical <samba-
> > technical@lists.samba.org>
> > Subject: Re: [PATCH][SMB3] Add missing defines for new negotiate contexts
> > 
> > Hi Tom,
> > 
> > >> The Windows protocol documents were updated on March 13 for the
> > >> upcoming "19H1" update cycle.
> > >>
> > >> MS-SMB2 version page, with latest, diffs, etc:
> > >>
> > >> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-
> > smb2/5606ad47-5ee0-437a-817e-70c366052962
> > >
> > > So, there was a defect in the published spec which we just corrected, there's a
> > new
> > > update online at the above page.
> > >
> > > The value of the new compression contextid is actually "3", but the earlier
> > document
> > > incorrectly said "4". There were several other fixes and clarifications in the
> > pipeline
> > > which have also been included.
> > >
> > > Redline diffs as well as the usual standard publication formats are available.
> > 
> > There's no server behavior defined for
> > SMB2_NETNAME_NEGOTIATE_CONTEXT_ID. If there's none, why was it added
> > at all?
> 
> It's an advisory payload, and can be used to direct the connection appropriately
> by load balancers, servers hosting multiple names, and the like. It's basically the
> same servername that will be presented later in SMB2_TREE_CONNECT, only it's
> available early, prior to any SMB3 processing. Other possible uses are for logging
> and diagnosis.
> 
> It has no actual function in the SMB3 protocol, so apart from defining the payload
> it's not a matter for the MS-SMB2 document. We would hope, however, that clients
> will include the context when sending SMB2_NEGOTIATE.

IMHO Looks like a reinvention of the 'netbios name' field that
allowed us to do clever things with the smb.conf 'netbios
alias' parameter :-).

