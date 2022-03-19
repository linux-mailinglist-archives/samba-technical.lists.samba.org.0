Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E200B4DE752
	for <lists+samba-technical@lfdr.de>; Sat, 19 Mar 2022 10:41:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=xoNbeTvNjf7j0odxXa35q2WkEPqZF1rfnRBNLDZSJcc=; b=no3vjP2g91MsNCl32vMtvPa9yz
	iglcMf0DTD7+qx19RndVXXJRFYPz0zRDKXixbXYRub279SnfPDKlYu+VHpEgZnqL6htD+npR5Gsuu
	D+9E/3D1DKJmoJ6uXP4+FUpmwnyAR6B9mQ/hHL3RSjlkLfvnELzZnvAVtbCVh5qpVBHtwhADjAY4O
	newtKZm+DoB//zqirrL5w1ws+ilQaNWPBwqjW6+7BVz2Ne6z2PjxeBdM6toajyY8lbrju0UnXx90S
	PbIM8dMVB6k2kHW4ceArELkf8Uk6jqeLjc4GmlrFXT/TxFpPPrLz/47bbiq6oS4exDNshfZP54iGG
	JvKWaxIA==;
Received: from ip6-localhost ([::1]:25144 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nVVZe-003b33-Ti; Sat, 19 Mar 2022 09:40:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37718) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nVVZY-003b2u-6z
 for samba-technical@lists.samba.org; Sat, 19 Mar 2022 09:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=xoNbeTvNjf7j0odxXa35q2WkEPqZF1rfnRBNLDZSJcc=; b=u037/XDUc1M0Qu0taST1tXwRip
 wEzerXOnDxItrXuhKGcrWJau2E1Y7yR4l4yi8tPz8QPXST0cJQMdVcoeLGHxfeS7gaRRoh42779lL
 eE/Ap1rEdxosBhKRMCDP3n0pBB53NWYH3r7sqR4U5ngFYSNn51ovwdFLUSLvQVZtRxs4ziShF+6ng
 AehApVdx+75kQUhnrA+67Gs3EZa/Lf2Jm5wUnVUA2LA+AHmuZZ1uYAfDJQ71KBC+IE1rjw2eO4QgN
 isepaeqgvn+NDe43nSoc/u64L7BSPo3YLIOd/ecZRbPccQvQ+1aji3ZfFDDD4yvdORt/NAnZPDar/
 GXWw3sIov/ThoF3XjxSNaaQvYogJRlMHxSpZd2c0Y4ngTL/S/eXCID5dVrzQJA/WVEXrEQ6ejbooU
 WWacB7c9tlHYZfp5hz/U2JGKb/6Kbco2QVlbyhsJ00QwnkwPjXakdODuOc6q2JHzObvNBKaxLzDoi
 qwoM5YEhEFV8EtFBI3A9nrus;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nVVZV-002I7C-5p; Sat, 19 Mar 2022 09:40:29 +0000
Date: Sat, 19 Mar 2022 11:40:26 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: We need to rework "allow weak crypto" mode in Samba
Message-ID: <YjWlCoHEI9qvaUn/@pinega.vda.li>
References: <e0c3b5921e018a5b74448f40a26af4015193824c.camel@samba.org>
 <CAH9M6r+uJ8VPTdHy_=094QXOqQaf63DpfN9H0k0kUaKfUk5ajA@mail.gmail.com>
 <0d1584239bc53567cb2165074b63338d6570f4d6.camel@samba.org>
 <CAH9M6rL7Xc9BnymYt5vgiacwG4jOStNBmumvgOt0dDMGwSwVVg@mail.gmail.com>
 <3ada695fdff1b1cb3e1f0edd14b41e9b4605dff4.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ada695fdff1b1cb3e1f0edd14b41e9b4605dff4.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Aleksandar Kostadinov <akostadinov@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On la, 19 maalis 2022, Andrew Bartlett via samba-technical wrote:
> Fair enough, and largely my point. Samba doesn't really have a FIPS
> mode (given it is applied inconsistently), we have a "allow weak
> crypto" switch currently controlled by the GnuTLS detection of the
> system FIPS
> mode.   
> We should have better global control of weaker crypto, to allow
> organisational policy guides to be written, that is beyond the
> GnuTLSFIPS mode.

If you'd want to simulate and enforce restrictions through GnuTLS like
in FIPS mode, I think it is better to define configuration for crypto
libraries that used during the testing.

Judging by Debian's gnutls build configuration, it does not override
defaults, so /etc/gnutls/config is the file with a default
configuration. In Fedora and RHEL-alike it uses
/etc/crypto-policies/back-ends/gnutls.config, allowing an easy switch
with 'update-crypto-policies' tool.

If you want to test with a GnuTLS configuration similar to FIPS mode as
seen by CentOS 9 Stream (it tracks FIPS 140-3 right now), then expected
configuration files can be found in
https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/tree/master/tests/outputs,
for example, https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/blob/master/tests/outputs/FIPS-gnutls.txt
for GnuTLS.

That is not enough, though. Samba AD is built against a Kerberos
library, be it Heimdal or MIT Kerberos. Both link against OpenSSL, so
you'd need to have a way to limit those configurations too.

Here we come to another problem. Both Debian and Ubuntu distributions do
not really have a normalized way of switching configurations for crypto
libraries. It means you'd need to apply the same logic to default
openssl config and you'd need to modify a system one. Here is what it would look like:
https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/blob/master/tests/outputs/FIPS-opensslcnf.txt

Same with krb5 libraries. Looks like neither Heimdal nor MIT Kerberos
builds in Debian provide a configuration file by default. We may just
extend our own template to force configuration like 
https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/blob/master/tests/outputs/FIPS-krb5.txt

Note, though, if you'd follow strictly FIPS 140-3 (or even FIPS 140-2)
requirements, krb5kdf function is not FIPS-compliant, so aes256-sha1 and
aes128-sha1 encryption types could not be used in FIPS mode. Active
Directory has no support for RFC 8009 types (aes256-sha2 and
aes128-sha2), so in a strict following of a FIPS 140-3 environment,
there is simply no way to interoperate with Microsoft Windows clients in
Active Directory. I believe Samba AD has no support for these encryption
types either even though underlying MIT Kerberos and Heimdal do support
them.



> Andrew,
> On Fri, 2022-03-18 at 21:00 +0200, Aleksandar Kostadinov wrote:
> > It is good for samba to have some switch for enabling only secure
> > algorithms. But I don't think it has to be implemented by the FIPS
> > mode. Some newer secure ciphers can yet be unaccepted in a FIPS
> > standard. FIPS doesn't mean highest security. It just means the FIPS
> > standard.
> > 
> > On Fri, Mar 18, 2022 at 8:36 PM Andrew Bartlett <abartlet@samba.org>
> > wrote:
> > > Correct, Samba can't be FIPS compliant, but we can avoid using
> > > known
> > > 
> > > poor cryptography not for certification purposes, but for sensible
> > > 
> > > 'secure by default' or at least 'can be configured to be sensibly
> > > 
> > > secure' design principles. 
> > > 
> > > 
> > > 
> > > Just as you wouldn't offer SSLv3 even when the host is not FIPS-140
> > > 
> > > certified.
> > > 
> > > 
> > > 
> > > Samba's CI system runs on a Ubuntu 20.04 base for the majority of
> > > the
> > > 
> > > tests (as mentioned, we run a tiny number of tests in a Fedora 35
> > > 
> > > environment to test "FIPS mode"), but most importantly the final
> > > 
> > > autobuild is under the Ubuntu 20.04 platform, so we should ensure
> > > that
> > > 
> > > our tests are run there when possible.
> > > 
> > > 
> > > 
> > > I'm quite disappointed at the "FIPS mode" in GnuTLS is optional in
> > > this
> > > 
> > > way - also denying any application or administrator the opportunity
> > > to
> > > 
> > > opt out of weak ciphers on a per-app basis - but that is life.
> > > 
> > > 
> > > 
> > > Andrew Bartlett
> > > 
> > > 
> > > 
> > > On Fri, 2022-03-18 at 12:07 +0200, Aleksandar Kostadinov via samba-
> > > 
> > > technical wrote:
> > > 
> > > > How can samba be FIPS compliant on a non-FIPS compliant operating
> > > system?
> > > 
> > > > Might be easier to just run the tests in a FIPS compliant
> > > environment.
> > > 
> > > 
> > > 
> -- 
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
> Samba Development and Support, Catalyst IT - Expert Open SourceSolutions

-- 
/ Alexander Bokovoy

