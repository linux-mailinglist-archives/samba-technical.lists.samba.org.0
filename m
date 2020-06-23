Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F65204C11
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jun 2020 10:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=0s2FqZ06t52QhCBgrtA9+UYSn1Ew+WpyYHD11uQ1Kuo=; b=0E1USaGa45FIT0rVi3squXFMCr
	Vprln/dZ2KVLAcmkIz302YDNBzKEAY6uAalDiATEbLVCqV7u7YpLROJqcsD8QrcjN4lyGoftoPaOV
	Ch2PV+6rKSimW5eiVLxD0oy89FTIOlWtISJcUk0+DbPBrbJNFqlucOVFXLY2GgjBXU7OBVb2HXlgj
	CYWFg1Gva6XoXWU/GODsAyKw7ftj7ytS9Mrm4+14DiVsdWHv8v90SlXLhsolrgKyQh4ZW4Dvq4S11
	jz2gaOjxRe1DSPomdmr+59flbWgJYJDecmKTB3HDevKnduNAykqctuBSySCO3iBM0FGxsTW8UPIQ9
	XoW/CUrA==;
Received: from localhost ([::1]:45986 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jne81-001y3q-3a; Tue, 23 Jun 2020 08:18:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35686) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jne7v-001y3j-Cq
 for samba-technical@lists.samba.org; Tue, 23 Jun 2020 08:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=0s2FqZ06t52QhCBgrtA9+UYSn1Ew+WpyYHD11uQ1Kuo=; b=Mw2d8oM5ZfpGUvUe46f7nTao+t
 E0WQVpGkImTV1A1mLYcqaksHUw4wkfYpTII9A2/vnwnxK0o26uiJDg4oP2rcHO/ivZj+tq0jcc9FS
 NYTAa/ehi+uT9D4W+kMfnRMNni8v6r8/+G4TFYqF6LL5xUqn2Fe/J970ixjM9TleqW8pnBHBOHfXP
 WtEBWhUnz3mvjfeQLt5BHynaUwnUG5MWAjtY72tFXZPuigHmFz1r3xgiMuLXENTwG4jA4Ey5wZRpM
 dnuHWnhNqDNfXJXxrqA5y/WnY0usnVFKfTXMLWeozHTsNLTIC0glSh848oqozbnj7axNON3JgoUUo
 vaSqeI75/apgOdWmwUtf+ZU8SR4qC5zEz/Kdp9/BxoQUxxqSNyv2hJb43tN1pUplBbcDGdlhHKB5V
 CHu/6BvLNNQs0qs/JoNriu55Zurn2ci5WqVtuVWESq0VKVbdg8Dnun+fHjOdw9hDJXR7xNbl8ATVs
 7kTbK8KG+2t57ANtIFJe/RGL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jne7t-0001Eu-Vj; Tue, 23 Jun 2020 08:17:54 +0000
Message-ID: <5eb2c5d125f7328e234935f15b7591318d521f68.camel@samba.org>
Subject: Re: gitlab: testing of ldap-ssl-ads option
To: Isaac Boukris <iboukris@gmail.com>
Date: Tue, 23 Jun 2020 20:17:46 +1200
In-Reply-To: <CAC-fF8TfDWmVS8iy4Br0oH1KOWessZEGg18QGRmwcO7Chjg11A@mail.gmail.com>
References: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
 <20200619181956.GF10191@jeremy-acer>
 <CAC-fF8SYbXaz33yJ_QaZzeYh2uBt3iKxHzbQNtMPm5qqwvAciQ@mail.gmail.com>
 <CAC-fF8Stst7BnrEKVQLP7og-HLp=T+NNoiSpUmRD3mwxXtK67Q@mail.gmail.com>
 <20f59230-59fa-9946-3b4f-937cd1bf619a@sernet.de>
 <CAC-fF8SPmfGbokEzBjZW9zBqbDYeTUg8YN8i_cWY-UN3th1QPA@mail.gmail.com>
 <a2cbe7499956d3d2318326c935954b3636ad8d8a.camel@samba.org>
 <CAC-fF8RQztBgiFTCS6AxVWLsjV3UWyWNUK2Cz7qKpE6hWCy7uQ@mail.gmail.com>
 <e444558549bb3dede91b551e1c13c3bbdae74847.camel@samba.org>
 <CAC-fF8TfDWmVS8iy4Br0oH1KOWessZEGg18QGRmwcO7Chjg11A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-06-23 at 10:12 +0200, Isaac Boukris wrote:
> 
> Thanks for the context, still unclear why "ldap ssl ads" depends on
> "ldap ssl", and requires it to be set to "start-tls" instead of, say
> ldaps.

I wouldn't worry to much about the history here, just make a sensible
practical set of option behaviours with defaults matching current
default behaviour, add to WHATSNEW and document it in man smb.conf. 
Splitting the two parameters would seem to be the first step.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




