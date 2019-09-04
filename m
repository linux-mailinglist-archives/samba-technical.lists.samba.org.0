Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E00BA8749
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 20:35:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Iit9sUoPeQmjyxERKbjB87I9G1e+zHn6AQs4MmSP0bY=; b=a5YkaBF+BbLrpv02Q+bmKR4yqn
	Wg73sXmTm75xlXim+KSmYKdNv3sE8EIs3Vl8Jg3NNeX/Q/yqN9mYV4dXTlWZTsoboikhLyl0c38pL
	J5kRAIElz7TwRqGriJisjsWJ3rnMhRBiMm8iTr2FT+8HUVW2b7Sa6/d7TjKTXwZ10aL+FpsKeHRdj
	4LONdHNeLN1xV616vPGo6Qt0KQJm4/AmYD98GW4Vm2AMy74/GuxNXn4M/x08S9frduwcVCvD2k3xR
	24JuAdg+qvdlJKUKD8t70GIv12WmUjGSlba4aP4lq923PiCcxr0JonMWSqDeKPsM+RkxnQgPa+jNg
	FM9wz/bQ==;
Received: from localhost ([::1]:45046 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5a7Q-003TN4-Ks; Wed, 04 Sep 2019 18:35:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17366) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5a7M-003TMx-G5
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 18:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=Iit9sUoPeQmjyxERKbjB87I9G1e+zHn6AQs4MmSP0bY=; b=d6y4XkARq6jApHHKHbuEcScjnP
 rSq72RTvWRNwALWf0npmw05oWZlOyRttZgg8AC7NxL39qG/3qh1QCaLQCZ2TkRNQ6sM7y8CJnDYn2
 9tvFOangFvWY0qukOkKFjxgdgNx0qzYBY7EnICOrMFUyXlHMJ2Fi75SqxY14e7oSHy98=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5a7K-00018Y-UU; Wed, 04 Sep 2019 18:34:55 +0000
Message-ID: <43fda24acfc63961446586339798f9d7801601bf.camel@samba.org>
Subject: Re: PROPOSAL: deprecate plaintext password support (in SMB1) for 4.11?
To: Jeremy Allison <jra@samba.org>, Stefan Metzmacher <metze@samba.org>
Date: Thu, 05 Sep 2019 06:34:49 +1200
In-Reply-To: <20190904155450.GA162682@jra4>
References: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
 <e5796781-277a-5e10-cd55-0322f42783d7@samba.org>
 <20190904155450.GA162682@jra4>
Content-Type: multipart/mixed; boundary="=-BXdfZPs9pdhfjoXZYs/2"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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


--=-BXdfZPs9pdhfjoXZYs/2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-09-04 at 08:54 -0700, Jeremy Allison via samba-technical
wrote:
> On Wed, Sep 04, 2019 at 12:58:25PM +0200, Stefan Metzmacher via samba-technical wrote:
> > Hi Andrew,
> > 
> > > It is quite late for Samba 4.11 but I wondered what folks would think
> > > of marking 'encrypt passwords' as deprecated so we can consider to
> > > remove this code in Samba 4.12 (eg master) later this year?
> > > 
> > > This would dovetail with the SMB1 deprecation effort and I hope also
> > > help find users who can't live without this (because SMB2 doesn't have
> > > this at all).  
> > > 
> > > I'm unclear if this even works, given bugs like:
> > > https://bugzilla.samba.org/show_bug.cgi?id=9705
> > > 
> > > If this is supported I'll polish up the attached patch and then write a
> > > WHATSNEW for 4.11.
> > 
> > I don't see an attached patch, but I like the idea of deprecating
> > plaintext passwords,
> 
> +1 on removing the plaintext password code.
> 
> > maybe we should also deprecate lanman auth
> > and ntlmv1, we may not go on and remove them before SMB1, but
> > people should avoid them.
> > 
> > > It doesn't commit us to doing anything in master / 4.12 (and we might
> > > want to wait till closer to the end of the year for feedback), but I
> > > took a stab at seeing what it might allow us to remove and this was the
> > > diffstat (and there is probably more if we tried):
> > 
> > For now just mark them as deprecated and defer the removal decision.
> 
> +1 on deprecate lanman auth and ntlmv1, but we can't
> remove I think until SMB1 is removed.

OK, sorry for my late-night patch non-attachment.  I think my mail
client even prompted me!  Oops.

I'll write up something similar for lanman auth.  NTLMv1 will be with
us a long time due to MSCHAPv2 sadly, but I'll see about some stern
words.

Thanks for the support.  I agree actually decisions come a long time
later, after we asses the feedback.  We might not even hear from real
users before 4.12 branches off given how long it takes folks to
actually start using new Samba versions. 

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba


--=-BXdfZPs9pdhfjoXZYs/2
Content-Disposition: attachment; filename="encrypt-passwords.patch"
Content-Type: text/x-patch; name="encrypt-passwords.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA1ZDA4MzEwYmU3MmRhOGE3YTJiZmVmOWU2NWFlNTZjOThkNzMxNjA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgQmFydGxldHQgPGFiYXJ0bGV0QHNhbWJhLm9yZz4K
RGF0ZTogV2VkLCA0IFNlcCAyMDE5IDE2OjQzOjEzICsxMjAwClN1YmplY3Q6IFtQQVRDSCAxLzdd
IHNtYi5jb25mOiBEZXByZWNhdGUgImVuY3J5cHQgcGFzc3dvcmRzIgoKVGhpcyBhbGxvd3MgU2Ft
YmEgdG8sIGluIHRoZSBmdXR1cmUsIHJlbW92ZSBtdWNoIHN5c3RlbS1zcGVjaWZpYyBjb2RlIHRy
eWluZyB0bwpkZWFsIHdpdGggcGxhaW50ZXh0IHBhc3N3b3JkcyBkZXNwaXRlIGFsbCBtb2Rlcm4g
Y2xpZW50cyByZWZ1c2luZyB0byBhdXRoZW50aWNhdGUKd2l0aCB0aGVtIGJ5IGRlZmF1bHQuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQmFydGxldHQgPGFiYXJ0bGV0QHNhbWJhLm9yZz4KLS0tCiBk
b2NzLXhtbC9zbWJkb3Rjb25mL3NlY3VyaXR5L2VuY3J5cHRwYXNzd29yZHMueG1sIHwgNCArKysr
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZG9jcy14bWwv
c21iZG90Y29uZi9zZWN1cml0eS9lbmNyeXB0cGFzc3dvcmRzLnhtbCBiL2RvY3MteG1sL3NtYmRv
dGNvbmYvc2VjdXJpdHkvZW5jcnlwdHBhc3N3b3Jkcy54bWwKaW5kZXggNGJkOTc4MDlkODYuLjJh
ZDFiNmMxYmUzIDEwMDY0NAotLS0gYS9kb2NzLXhtbC9zbWJkb3Rjb25mL3NlY3VyaXR5L2VuY3J5
cHRwYXNzd29yZHMueG1sCisrKyBiL2RvY3MteG1sL3NtYmRvdGNvbmYvc2VjdXJpdHkvZW5jcnlw
dHBhc3N3b3Jkcy54bWwKQEAgLTEsOCArMSwxMiBAQAogPHNhbWJhOnBhcmFtZXRlciBuYW1lPSJl
bmNyeXB0IHBhc3N3b3JkcyIKICAgICAgICAgICAgICAgICAgY29udGV4dD0iRyIKICAgICAgICAg
ICAgICAgICAgdHlwZT0iYm9vbGVhbiIKKwkJIGRlcHJlY2F0ZWQ9IjEiCiAgICAgICAgICAgICAg
ICAgIHhtbG5zOnNhbWJhPSJodHRwOi8vd3d3LnNhbWJhLm9yZy9zYW1iYS9EVEQvc2FtYmEtZG9j
Ij4KIDxkZXNjcmlwdGlvbj4KKyAgICA8cGFyYT5UaGlzIG9wdGlvbiBpcyBkZXByZWNhdGVkIHdp
dGggU2FtYmEgNC4xMSBhbmQgd2lsbCBiZSByZW1vdmVkCisgICAgaW4gZnV0dXJlLgorICAgIDwv
cGFyYT4KICAgICA8cGFyYT5UaGlzIGJvb2xlYW4gY29udHJvbHMgd2hldGhlciBlbmNyeXB0ZWQg
cGFzc3dvcmRzIAogICAgIHdpbGwgYmUgbmVnb3RpYXRlZCB3aXRoIHRoZSBjbGllbnQuIE5vdGUg
dGhhdCBXaW5kb3dzIE5UIDQuMCBTUDMgYW5kIAogICAgIGFib3ZlIGFuZCBhbHNvIFdpbmRvd3Mg
OTggd2lsbCBieSBkZWZhdWx0IGV4cGVjdCBlbmNyeXB0ZWQgcGFzc3dvcmRzIAotLSAKMi4yMi4w
CgoK


--=-BXdfZPs9pdhfjoXZYs/2--


