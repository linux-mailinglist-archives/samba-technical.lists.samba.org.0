Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A86CB7824C9
	for <lists+samba-technical@lfdr.de>; Mon, 21 Aug 2023 09:46:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hmxR1wkCSk4Z+hTyCBZivJgzLEFv//eDHsxI7wZeNFE=; b=3nkXjoralEVN1SWEXOinCmVx7K
	kEzTdJ0IynkZCy7yaeL4Brl+yW595BkfYgVewdLxYGddFxoqycSoBgMkluAOttSYeeqEgevvxtuA3
	U05ZmfUjUZYUbi7iMrYTkdQiV7GcIbfr/3Bi/yCo9eGnWVsTrIe/tZj1G5f5ts3kj4aYOHgdQjUuK
	RVk3G3kAd7oj7R/Gwpt1jZa7mABTMLgYuHNGb20SgfBEWWWO5B+hoMQq5zOYVQmPicSytJ7biMnCV
	vqJg9WP2NAQzHQfSJ70zU/3loH3PrDbHSX4in8SkhMkf9cwg24t1yZMxdYBmfayTrV1mkicf6/HIV
	PE8H7VlA==;
Received: from ip6-localhost ([::1]:56720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qXzbd-00DaQP-Sd; Mon, 21 Aug 2023 07:45:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60770) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qXzbF-00DaQF-Jn
 for samba-technical@lists.samba.org; Mon, 21 Aug 2023 07:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=hmxR1wkCSk4Z+hTyCBZivJgzLEFv//eDHsxI7wZeNFE=; b=t9+oJ22zx0IBqUz4mK8MRZ4fEZ
 0jXNA30I+B3QTiCGz3kOW88NGdxLXGpMY4Au2MukXT3TjOTwiThR6xeyURv0BOIZ+nH6OSfCI2Zfd
 7O/sItUaMG+VuDM3mVs+nE0RHliIesg2Cy1Ph4/EWLV45lOT5ElG+9t1ecuWf0jzlYM7XpupNztx+
 PvPYN4VnmDSCeOHWtUi2JSoxWEuWuWVIkMxc7N4hIshTcdeYu3W+umYgEmcczIx9lW2NnMlYvSR/L
 jc011y8r5PeXE7uomMM9zUKxa6Dk3aZcr3XC1flS1c7KWR3cV6PeBoLrsEq1wHglb/WuIGLyLZoOZ
 hQx9LhI5hMXrrLV0PiHW7Z84gr+lwqEU6zwpfBJZqiyrCkzR4eqQtZV4jbpqISz+cVz+Kz8O5IQR1
 BAQf3i9ynCtGn57y6PjCe/SIPb3UwhHXjavnGefYuRXYFTSJtN8pFdhxlvh0326KHU8eUFU+yGEFu
 u6Z78QISolJxMqEyEezY8+y0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qXzb0-0099R1-2W; Mon, 21 Aug 2023 07:45:06 +0000
Date: Mon, 21 Aug 2023 10:44:39 +0300
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
Message-ID: <ZOMV5z7GeqXe98o9@toolbox>
References: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
 <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
 <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
 <14854277.O9o76ZdvQC@krikkit>
 <8373bd2101510ccf1af3b2fc005c6fe9673504af.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8373bd2101510ccf1af3b2fc005c6fe9673504af.camel@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Пан, 21 жні 2023, Andrew Bartlett via samba-technical wrote:
> On Sat, 2023-08-19 at 20:06 +0200, Andreas Schneider wrote:
> > On Friday, 18 August 2023 02:08:00 CEST Andrew Bartlett via samba-
> > technical 
> > wrote:
> > > I would note that times when we didn't line up the CI version and
> > > Python 'supported' version, it kept breaking.
> > > I note that RHEL7 ends 'maintenance' in June 2024, just after the
> > > 4.20
> > > release March 2024
> > > https://www.redhat.com/en/blog/end-maintenance-red-hat-enterprise-linux-7-al
> > > 
> > > most-here Those dates I think give good cause to drop CentOS 7, but
> > > other
> > > views still welcome.
> > 
> > I'm fine with dropping Python 3.6 support for Samba 4.20.
> 
> Thanks.  
> 
> So far we seem to be missing the markdown and dns packages for Python
> 3.8 on Centos8 Stream.  Do you know where I might find these packages,
> or how we might get them to become packaged?
> 
> The other important but not totally vital packages I couldn't find for
> Python 3.8 was setproctitle and gpg.
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/3231
> 

The reason why we stuck with Python 3.6 on RHEL 8 (and therefore on
CentOS 8 Stream) is because packages in the distribution, when installed
in the default configuration, can only depend on the packages available
in non-modular or in default modular streams. Python 3.6 is the one
available by default. All other Python builds are separate modular
streams not enabled by default.

This is why FreeIPA (which is packaged as a module in RHEL 8 and is
available in two streams, one enabled by default and one not enabled by
default) and Samba (which is packaged as a normal package) only depend
on the content that is enabled by default, e.g. Python 3.6. FreeIPA use
case is important here because it is the primary user of Samba Python
modules in RHEL.

We cannot change this situation in RHEL 8, so we stuck with Python 3.6
support in RHEL 8 until its retirement. If Samba drops Python 3.6
support, we cannot rebase to this new version of Samba in RHEL 8. It is
probably OK as RHEL 8 is already reaching 8.9 minor version after which
rebases will become hard to impossible (RHEL 7.9 is the last RHEL 7
minor release already). We also cannot migrate to python3.11 there at
this point.

In RHEL 9 both Samba and FreeIPA are packaged as normal packages, the
modularity support is removed. Both continue to use the same default
Python version which is already Python 3.9. 





> Andrew Bartlett
> 
> 
> -- 
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead                https://catalyst.net.nz/services/samba
> Catalyst.Net Ltd
> 
> Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
> company
> 
> Samba Development and Support: https://catalyst.net.nz/services/samba
> 
> Catalyst IT - Expert Open Source Solutions
> 
> 

-- 
/ Alexander Bokovoy

