Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F895CDAD
	for <lists+samba-technical@lfdr.de>; Fri, 23 Aug 2024 15:22:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=YqubPSbosPV5jgGnAgJ2amswF0hQKABp49RdOjYClVM=; b=kxox4BE3eRlD+IJ9K4fFkqzhNX
	qhL0KKXwbBPIPTK/VWQxRTQBH3TZPJPa4W+1Aqjl8xWJnnpLHdQI7X49+f8kKRQFpGf7pAFI2erq0
	WQmWxtclnBXSnjU0qrYgGgUR9vjBwJZmJq6mYWMNQfa6zO62BieYcMdGiHA7FvgwafkC4qRwhDJhJ
	+/Z34bNsxVJC6Kzm4DmGRQ5h2G/wGNg49df4GJm4dM/COMD65QPj/FVFScqIsbcRtHB4m9kqxGr2T
	aY0KfiXb6SlYdvo0kAVqTfaoiHarXvMqAhAsd84un+IzsJyROjRDPx14xq0JYBFFHHuTS4+NsGvU/
	/r3qDfRg==;
Received: from ip6-localhost ([::1]:48444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1shUE5-005LDX-LW; Fri, 23 Aug 2024 13:21:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28682) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1shUDz-005LDO-RI
 for samba-technical@lists.samba.org; Fri, 23 Aug 2024 13:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=YqubPSbosPV5jgGnAgJ2amswF0hQKABp49RdOjYClVM=; b=1Z0YEVmGV7ty1nYuic+HgOcKqJ
 je2ZyY/eAc4pCsFRlQtO5rJRIwzpjpK4Xzc1jI42Ontp0XSeS9BKef1WrxThXQDiSxoeT00HrpZpJ
 070mbzc03+qPWfLNvQ8Qc2lMBKer5jpLdB8tmclj16a+QOgInP63VISi8acmBw6D7orLnASGHQfeR
 YlSnT/kzc0xxdc/DpbNnynyrbu5QUVu45FjPAZiWY5uRbEmCDyK+aqsWiJW3HuEugOrwvgC+fVtre
 2/5lbxivK6wCZKMvBO1RRao64lCYM+8OCIuQgIIg2DprxieMl3qi7NylyFpbAlNIWEqFuZOeMUfnH
 r57eQ1odXUTL8lEQZraLdVP73+O9mqRrbZc0T+7DcdMzm9gqFVUcJCa9+CVd22dAcgzAYC+7EZvgJ
 L0ayzOHTQ29ha0sbJrgdHIulOtBirMy0pHiksn8Aif0ns+OBPic8Pusi0cHEEXG3FWpVvCbqGrZ69
 39mYHG2ymGbjJ/Daz6tJ8Qcw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1shUDw-007ojn-2h; Fri, 23 Aug 2024 13:21:05 +0000
Date: Fri, 23 Aug 2024 13:20:52 +0000
To: David Howells <dhowells@redhat.com>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
Message-ID: <20240823132052.3f591f2f.ddiss@samba.org>
In-Reply-To: <319947.1724365560@warthog.procyon.org.uk>
References: <Zk/ID+Ma3rlbCM1e@jeremy-HP-Z840-Workstation>
 <CAN05THTB+7B0W8fbe_KPkF0C1eKfi_sPWYyuBVDrjQVbufN8Jg@mail.gmail.com>
 <20240522185305.69e04dab@echidna>
 <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk>
 <20240523145420.5bf49110@echidna>
 <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
 <476489.1716445261@warthog.procyon.org.uk>
 <477167.1716446208@warthog.procyon.org.uk>
 <6ea739f6-640a-4f13-a9a9-d41538be9111@talpey.com>
 <af49124840aa5960107772673f807f88@manguebit.com>
 <319947.1724365560@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Paulo Alcantara <pc@manguebit.com>, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org,
 David Howells via samba-technical <samba-technical@lists.samba.org>,
 Tom Talpey <tom@talpey.com>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks for the follow up ping...

On Thu, 22 Aug 2024 23:26:00 +0100, David Howells wrote:

> >         if (out_output->length > in_max_output) {
> >                 DEBUG(2, ("QAR output len %lu exceeds max %lu\n",
> >                           (unsigned long)out_output->length,
> >                           (unsigned long)in_max_output));
> >                 data_blob_free(out_output);
> >                 return NT_STATUS_BUFFER_TOO_SMALL;
> >         }
> > 
> > I'm guessing in this case we need to just truncate out_output->length
> > to in_max_output and return STATUS_BUFFER_OVERFLOW.  
> 
> Do you perchance have a fix for this?  I'm seeing it cause failures in
> xfstests when running against cifs connected to samba.

I've proposed a fix via
https://gitlab.com/samba-team/samba/-/merge_requests/3775

If you want to try it yourself...

The following changes since commit b0996ed589a931902a304237d6c03efce2b16f6b:

  s3:tests: Fix spelling error (2024-08-22 10:38:09 +0000)

are available in the Git repository at:

  https://gitlab.com/ddiss/samba.git qar_rsp_truncation

for you to fetch changes up to 3c034c4d177ea2367b3131f813381d91c98ab7e1:

  s4:torture/smb2: test FSCTL_QUERY_ALLOCATED_RANGES truncation (2024-08-23 13:06:04 +0000)

----------------------------------------------------------------
David Disseldorp (2):
      smb2_ioctl: truncate FSCTL_QUERY_ALLOCATED_RANGES responses
      s4:torture/smb2: test FSCTL_QUERY_ALLOCATED_RANGES truncation

 source3/smbd/smb2_ioctl.c         |   4 +-
 source3/smbd/smb2_ioctl_filesys.c |  54 ++++++++------
 source4/libcli/smb2/ioctl.c       |   3 +-
 source4/torture/smb2/ioctl.c      | 150 +++++++++++++++++++++++++++++++++++++-
 4 files changed, 187 insertions(+), 24 deletions(-)


