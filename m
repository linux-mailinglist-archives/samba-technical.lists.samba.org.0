Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0F35A2D11
	for <lists+samba-technical@lfdr.de>; Fri, 26 Aug 2022 19:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6WZpViZNgR1/hRp8CSBwVaNRN7STwyR7VIzrI9ZEhMg=; b=pfc/xcM6ybImpoA9RZ/Mc3/RMU
	1R+fWROJ+9WDpQaPkmLDsbHeCVI0Zo72LTwSFkTu2B5cYlrEZTjZ5gFvAOwvmovr1KvZYOyUalrnm
	/mIzExacUFEKHnwAtlFvYZztG5kAq+YpeGr3mxuVjfW5ZQh7s3MkJxzrRPXJvySM1RRsqKaqw+1Zp
	BWENMjILzr/m8wLsit3x5+kXZWhhe/JSfx39IXEuQb5eyNvoewulXfzqoWieiKhB998mBfBDLkVc9
	i8p6U+VNSnPVA1uGZHqHHuJ3NCFVZXEss06gchVE/QHassv7htUP9bQgbn217Tg/XGKtAO2Ih4Zl0
	v9nfCeYw==;
Received: from ip6-localhost ([::1]:30308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oRckP-002cPO-TH; Fri, 26 Aug 2022 17:03:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62140) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oRckL-002cPF-B8
 for samba-technical@lists.samba.org; Fri, 26 Aug 2022 17:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=6WZpViZNgR1/hRp8CSBwVaNRN7STwyR7VIzrI9ZEhMg=; b=pIWk6Os67Jc8zJceVMvvfrMIsK
 BYXp6cWYxy8Cf5ji6aoN714aQ7HjhR297qE8/qewcNuR18MBebjx0BnERtyabVpHnkEk5DkCZ+Cig
 05CdJUxPYlesWl/1beFIH0ilW3+BSs3iclLTWkIV0s0Mlh9ALhUrLWnr1F/Z2d2efKGFVNGdXjkNg
 b9t7lAf1y5sR3wxzvwCttQIGmQCpUE/8mYLGxtTwF5vzhJc1MUKmGb5LIgi5W3aXh3O5CZ3MWlNVK
 m8KRVxnPCxnRQhp7cN/YUinPJ+pi6dZflD8Oksk6xxEQ5kdo+b0MKE0LKNuiXpz8Xot7EGK7ZVP+G
 7OfUUCjrqeYriWpWLl7t6DkXlyjM+gSuJNnYtGSTEVnBMZozRy/CdlOwgijmm6zhc76K5gxYKSlkP
 zy310YuUybfy8lTVK8AkWks+FsbJQeMtzXpZEjWpzvZFTwi80fiysuqEZogp8kGugCAXK49jWm1XM
 zr5SKCHRcXcYNS+xbpQ9Xe/G;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oRckE-001sGG-Cv; Fri, 26 Aug 2022 17:03:46 +0000
Date: Fri, 26 Aug 2022 10:03:42 -0700
To: Rowland Penny <rpenny@samba.org>
Subject: Re: Phantom samba-tool option
Message-ID: <Ywj87hCJ2MG7l5IS@jeremy-acer>
References: <e3eeb1eda243c5cd80260add048423173c2b0b32.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e3eeb1eda243c5cd80260add048423173c2b0b32.camel@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 26, 2022 at 09:19:58AM +0100, Rowland Penny wrote:
>Hi Jeremy, a user on the samba mailing list asked about the '-A' option
>for samba-tool, an option I had never heard of. It is shown in the
>samba-tool manpage:
>
>       -U|--user=[DOMAIN\]USERNAME[%PASSWORD]
>           Sets the SMB username or username and password.
>
>           If %PASSWORD is not specified, the user will be prompted.
>The client will first check the USER environment
>           variable (which is also permitted to also contain the
>password seperated by a %), then the LOGNAME variable (which
>           is not permitted to contain a password) and if either
>exists, the value is used. If these environmental variables
>           are not found, the username found in a Kerberos Credentials
>cache may be used.
>
>           A third option is to use a credentials file which contains
>the plaintext of the username and password. This option
>           is mainly provided for scripts where the admin does not wish
>to pass the credentials on the command line or via
>           environment variables. If this method is used, make certain
>that the permissions on the file restrict access from
>           unwanted users. See the -A for more details.
>
>           Be cautious about including passwords in scripts or passing
>user-supplied values onto the command line. For
>           security it is better to let the Samba client tool ask for
>the password if needed, or obtain the password once
>           with kinit.
>
>           While Samba will attempt to scrub the password from the
>process title (as seen in ps), this is after startup and
>           so is subject to a race.
>
>The only problem is that the '-A' option does not exist for samba-tool,
>it is a smbclient option.
>
>I traced it down to it coming from docs-xml/build/DTD/samba.entities,
>but I cannot see how I stop the samba-tool manpage from using it
>without totally removing the relevant paragraph, which will (I presume)
>remove it from the smbclient manpage. Can you suggest how this can be
>done, or should I open a bug report ?

This comes from : cmdline.common.credentials.user
which is included in:

manpages/samba-tool.8.xml

'-A' is described in cmdline.common.credentials.authenticationfile

which isn't included in:

manpages/samba-tool.8.xml

So the problem is the '-A' text:

------------------------------------------------------------
"A third option is to use a credentials file which contains
the plaintext of the username and password. This option
is mainly provided for scripts where the admin does not wish
to pass the credentials on the command line or via
environment variables. If this method is used, make certain
that the permissions on the file restrict access from
unwanted users. See the -A for more details.

Be cautious about including passwords in scripts or passing
user-supplied values onto the command line. For
security it is better to let the Samba client tool ask for
the password if needed, or obtain the password once
with kinit.

While Samba will attempt to scrub the password from the
process title (as seen in ps), this is after startup and
so is subject to a race."
------------------------------------------------------------

So I think maybe we need to duplicate this section without
the -A text as a new ENTITY cmdline.samba-tool.credentials.user
and include that inside manpages/samba-tool.8.xml instead of
cmdline.common.credentials.user.

I'm CC:ing this to samba-technical for opinions from the
rest of the Team, and I also think you should log a bug
so we can track it.

Thanks ! Jeremy.

