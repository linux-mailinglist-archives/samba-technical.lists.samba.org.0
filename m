Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE48A709B
	for <lists+samba-technical@lfdr.de>; Tue,  3 Sep 2019 18:41:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=244Bo6zT8PUtnPOQarCxT+eBNrqqZTFK+0hEZXIzlLA=; b=gSHkbl//efNBxZpt10RLXLmBt1
	z/rpG1/dfdw5Ik1cOlY1e7KSqlJchTTTP6bN2OodpD6FwuY+XOvFEtPH1zALF+aDUQrJwkg81WXEW
	CDiZwdsNMviLzZYy4EZIVypDR8bY8o9tmg+DL4LkXnVZ3Q8HDJx20GqOx0MOJqycVooHOD3Q2lr4A
	x3HDD9zjs/nRumn0h2vR6NRoN8rj39XQXgiNBfJnakDRaHGMDXhGfFnDEpvtGCOz7kUdYlRG6eeLR
	4ZBP85JpGTl8sqxn7+0stg8MUZU+ge/Sdwybb26fw6HijKhoFDIwjmKtN2cGoP8oZkL7tiSb3ONrB
	TtHTnbYA==;
Received: from localhost ([::1]:57552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5BrR-003EbY-Cj; Tue, 03 Sep 2019 16:40:53 +0000
Received: from mx1.redhat.com ([209.132.183.28]:43768) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i5BrH-003EbR-Mk
 for samba-technical@lists.samba.org; Tue, 03 Sep 2019 16:40:51 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0D6F618C8912;
 Tue,  3 Sep 2019 16:40:38 +0000 (UTC)
Received: from 10.4.128.1 (unknown [10.34.244.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16DFE5D6B7;
 Tue,  3 Sep 2019 16:40:36 +0000 (UTC)
Date: Tue, 3 Sep 2019 18:40:34 +0200
To: "L. van Belle" <belle@samba.org>
Subject: Re: [Announce] Samba 4.11.0rc3 Available for Download
Message-ID: <20190903164034.GA2128202@10.4.128.1>
References: <20190903111941.GA15245@carrie2>
 <20190903141225.GA2122626@10.4.128.1>
 <E99FB72BA8824B0FAB212FAE35B48FCC@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E99FB72BA8824B0FAB212FAE35B48FCC@rotterdam.bazuin.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Tue, 03 Sep 2019 16:40:38 +0000 (UTC)
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
From: Lukas Slebodnik via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Lukas Slebodnik <lslebodn@fedoraproject.org>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On (03/09/19 16:26), L. van Belle wrote:
>Hai, 
>
>Have you looked on the ftp? 
>The others are also there, see: 
>

I already did

>https://ftp.samba.org/pub/talloc/?C=M;O=D 

My web browser say to me that the latest version
for talloc is talloc-2.2.0.tar.gz
And it ass uploaded there on 2019-03-21 10:13
Which is 6 months old.

And talloc-2.2.0 is not a friend with python3.8
Morever I also checked git repo and the branch
And I could not see any new tag for talloc there?

Did I miss something?

LS

