Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D25026E13B4
	for <lists+samba-technical@lfdr.de>; Thu, 13 Apr 2023 19:48:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=H0ljqdBh7bXkpLMo8xVHuV0keuJy9MNbpGk1u9uTOR0=; b=SdMRlQN3IAh6EhWx0OqjJnx4if
	XqkhBo05CF4HrKop+RReRvpxQLI4V9cjSxaX6icI9cPjvJjKFPzKyO7vgLTFcN+ntZG7Js0M6mFRP
	hHIZovEP5maW5YD/aKAmJyH5WA8g7s+em/t1VaBEtR6UL69DrW5EUgw44aiRIDteSod86cYX6glj7
	y71i3Tm3sTcIilZ8wa4rBX0dIRLUZyA9UR68JjD9oESqh6gMhy24YxzAnBEDdk5xDAxAH7RTma2mR
	mNGBo7N+yaIo8hfDs72VjpzlKoTAh7fBU+1gJHNdzxIMH1RAdqAb6xEjqeDWqmcwsuGcaxgxSnG0/
	NaYJjpCw==;
Received: from ip6-localhost ([::1]:58576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pn13A-0018b9-TH; Thu, 13 Apr 2023 17:48:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51332) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pn136-0018b0-E6
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 17:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=H0ljqdBh7bXkpLMo8xVHuV0keuJy9MNbpGk1u9uTOR0=; b=YkToia+J7EOQiRrnh8KQY+kNRJ
 8ILz2NShQcBUfdmutmd7RicBGjDKosLgczhOzcEhflKV6oB75xeFJE/bAx+BM7JNK639Tnm0hGJWS
 jdgye2Zva/WwMemxM4MkWYe0JIX/GRd4gT1xYe41LZEKHPkbSQvESHeXm/LPzggvjiSFdd7tYH84V
 bK85M2GqTgdJc+2XlRtuQWnIc//uA2Ez9ntykWA7EGU2Y1lNTOizWJxKfVEWjKM3l9A0bjoZpk1kl
 Fozsr/AJK7uEoeo8pcXL0WsGfHiN8Rwxa4t4G29xmc0vwCGZpWmbuGBu47HJ8ulJnmu583EZNvt0S
 x96Yr59NiYXrz1L1f+gpVYaYjRQl14BcdPPNZyzh3aoDZ9bs7hKavVGvTCCmYpg+C9f+hETBM6TOK
 ZWQRa+Gcj/dwakDyhHjAcj6S3ZjRe6hhO5GLQlOFmUdN3D2e3rqpBVigkoMj6TQl496teMWmaByFr
 /NLbCrK7gXdsDyHlwnE86PIW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pn134-000yyt-CJ; Thu, 13 Apr 2023 17:47:54 +0000
To: samba-technical@lists.samba.org
Subject: Re: The strange issues happening with ad_dc_ntvfs environment
Date: Thu, 13 Apr 2023 19:47:53 +0200
Message-ID: <3234416.44csPzL39Z@magrathea>
In-Reply-To: <4cd5f631-f135-858c-5d9b-5913babef316@catalyst.net.nz>
References: <2142927.irdbgypaU6@magrathea> <13246326.uLZWGnKmhe@magrathea>
 <4cd5f631-f135-858c-5d9b-5913babef316@catalyst.net.nz>
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
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 13 April 2023 12:42:05 CEST Douglas Bagnall via samba-technical 
wrote:
> On 13/04/23 20:51, Andreas Schneider wrote:
> >> Is this with a full make test, like you were doing in February? I can
> >> have a go at that overnight on Ubuntu 22.04.
> > 
> > Yes, I'm still trying to get this working downstream and I think this
> > should still work even if CI/autobuild is not running a full make test
> > anymore.
> > 
> > This seems to be a bug in some test and we should fix it.
> > 
> >> First I'll try `make test TESTS=ntvfs`, just in case that works.
> > 
> > If I run
> > 
> >    make -j8 test TESTS="ad_dc_ntvfs s4member"
> > 
> > it passes just fine :-(
> 
> The TESTS=ntvfs passed. A full `make test` gives me these:
> 
> failure: samba3.blackbox.smbstatus.test_json_profile(fileserver:local) [
> failure:
> samba3.blackbox.smbclient.kerberos.smbclient.smb3.kerberos.off[//fipsdc/tmp]
> (ad_dc_fips) [
> failure:
> samba3.blackbox.smbclient.kerberos.smbclient.smb3.kerberos.off[//FIPSADMEMBE
> R/tmp](ad_member_fips) [
> failure: samba3.blackbox.smbclient_netbios_aliases [foo].smbclient
> (krb5)(ad_member:local) [
> failure: samba4.nbt.dgram.netlogon2(ad_dc_ntvfs) [
> failure: samba4.ntvfs.cifs.ntlm.base.unlink.unlink(rpc_proxy) [

If I run 'make test' in the Samba git tree, I get 4 failures. If I run it in 
mockbuild as part of the RPM building process there are a lot more.

That's strange.

I need to retry it with a release tarball and release flags next.

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



