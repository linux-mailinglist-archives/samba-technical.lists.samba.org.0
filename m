Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D932E285404
	for <lists+samba-technical@lfdr.de>; Tue,  6 Oct 2020 23:46:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=SLbQm1/YbWFbhUS0sYE184FVbcVYZQzK0+3tTLMcFeY=; b=2r6e67EZtnfj+wA/dBfUHnj4z6
	IRjs56Oblmfmu9588EFa4n1eVR+2ISKknszOc7Xtu9amOxkJ91CIpDZ0g5WBY1BUe4M5LLH0CxQdF
	63nkFBL2idX8CsQg9lue4J2UuhbfGsY0Ll7Sc+mQebeggXhZs9fVsXNzHDbjKVPRKE34aPDx/Tf6/
	wu34CCER2QYteRkDOgZSibLuLfBg6qlWr6M6T9VVyTN1R3XdZRUbjVPxjSyuA1QnAkZ9P2PzT+/Zh
	roWytBoF7CLQACknTNx2qLyyySSgnJ1ntMHr15eplBtVenfH3wwuPrWZzLV3h+HtcCKrRIw1DjTqJ
	IawNmJhw==;
Received: from ip6-localhost ([::1]:24802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kPum4-00B2fB-63; Tue, 06 Oct 2020 21:45:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12330) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kPulz-00B2f4-Jc
 for samba-technical@lists.samba.org; Tue, 06 Oct 2020 21:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=SLbQm1/YbWFbhUS0sYE184FVbcVYZQzK0+3tTLMcFeY=; b=HlU2pmNuVMas86XH+icIXara5R
 VrmD0LrtiZQWwU9KIU9g36is/EX5qZuaTHo8Ldmbp8NPTka+A+B2a4SpAQeS5FthhS85pLXlk0Rlf
 +HTqbQZrb+CYfbw36ug9eeZnXflF6jRhWkdkOf5UuNX62FCf2MzxAS3N4ESV7kYmFQjORaLJai71f
 Ohg8Vz4W9iveBBGdjCeJ9rNq18f/xkNuwgvR1ZEBYsUfA1MvKtrAqv04biKtLKmCYFY7nknTGpIns
 5LBlGObunvskQCam8mB6Sc7UmyEnKNnVUW+g8e1wMtZQXbmhH3Nqh0W+jweLvf7FvFM++Kv0lnmJd
 hgazo4wQ3hPUFXkxVKeRiEQXCxAwP5R97oqnCWh+P6DZ3PAYIHt3GyvciCy2LPAm3BEcrs+8PiKb7
 Sk0TeVsup9IFDuV2+HR30clWr1irEK7VC4NrEHWzDltQwNB2LznCa/i32X0q33JdZUKQC3y2XTPDM
 SsMTrSEpy4xYuB7aVaXaqpHq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kPulm-0002KA-0Z
 for samba-technical@lists.samba.org; Tue, 06 Oct 2020 21:45:15 +0000
Date: Tue, 6 Oct 2020 14:45:09 -0700
To: samba-technical@lists.samba.org
Subject: Re: PATCH: fix doc of spoolss:architecture
Message-ID: <20201006214509.GB2999597@jeremy-acer>
References: <20201006211147.GA696217@sernet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201006211147.GA696217@sernet.de>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 06, 2020 at 11:11:47PM +0200, Björn JACKE via samba-technical wrote:
> Hi,
> 
> can someone review and push, please?

LGTM. RB+ and pushed !

> From ef34f5270260549aeaa039d809fbc5e329faa0db Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Bj=C3=B6rn=20Jacke?= <bjacke@samba.org>
> Date: Tue, 6 Oct 2020 23:05:24 +0200
> Subject: [PATCH] docs: fix default value of spoolss:architecture
> 
> "Windows x64" is the default here since a couple of years already.
> 
> BUG: https://bugzilla.samba.org/show_bug.cgi?id=14522
> 
> Signed-off-by: Bjoern Jacke <bjacke@samba.org>
> ---
>  docs-xml/smbdotconf/printing/spoolssarchitecture.xml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs-xml/smbdotconf/printing/spoolssarchitecture.xml b/docs-xml/smbdotconf/printing/spoolssarchitecture.xml
> index 1eccf9f58cfd..dae739056638 100644
> --- a/docs-xml/smbdotconf/printing/spoolssarchitecture.xml
> +++ b/docs-xml/smbdotconf/printing/spoolssarchitecture.xml
> @@ -8,6 +8,6 @@
>  	architecture. Samba's spoolss print server architecture can be changed using
>  	this parameter.</para>
>  </description>
> -<value type="default">Windows NT x86</value>
> -<value type="example">Windows x64</value>
> +<value type="default">Windows x64</value>
> +<value type="example">Windows NT x86</value>
>  </samba:parameter>
> -- 
> 2.25.1
> 


