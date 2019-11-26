Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B04110A22D
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2019 17:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=+tp8vPQ5z4rvlaQgce9cu9AwfjwbsUrYPfg1XJ6SAM8=; b=EANNQ//L4Hl98AZaIzU+a/QGji
	wqV07X5cPH716XFbIBKDkLYJ0sOIhkUy3dEwneatVe7BZxzg71rdvMtsZKRiy90ppNxGvXsFGb/p5
	euMny7kFIf/Wi1I0OEC4K+0XzxUs9iqOChuJDdhPCuYKs3u7xWj/xHO6WkB9HjMX9fKplT7f8eXNX
	XMZMpgH4QM8KU4CWB6qie9m6UKpwvBXzRcXUYDQks3PnBzSecHSU3vaMaymqXUkvYhAw4opaGG7nn
	j9QRkrHTERB7BrBiyl6rf3DlFWUh0h1bWppHZ4Bidbcg7/5NxSZElsxFqjxBjR1iYlhjIDSuaKSj2
	6Z98ty5w==;
Received: from localhost ([::1]:58818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZdm2-002TLr-Gk; Tue, 26 Nov 2019 16:33:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10360) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZdly-002TLk-2z
 for samba-technical@lists.samba.org; Tue, 26 Nov 2019 16:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=+tp8vPQ5z4rvlaQgce9cu9AwfjwbsUrYPfg1XJ6SAM8=; b=GPf9IwXwWNLELN9QbS9KzSYDLo
 L1g5EsrKQPtv12SBc2pPfcdnc/IuZUilcV+Q1mPg8RLD7+pbDAXIvOBVnF5lpePAsq2rgGw1OQCq6
 SHDpFKQbO66QzUA/G8OpHuPC/EUqop+2X6neDdEFT1cCMYEWXqbU4E2vsMXNu+BNVKdTE81jtMil5
 aWG3a7A8MONj9vtC9lcN/fLvBqczHoM7PXEbTw23ioAY7nxr5QXoRGTypRqyl7DNB0IlSk1nyD3gf
 d8IGpsQIytv1Y0DXcMF23SncqgsQuarvHClaGGGSRX8uKXDvPuHAC8pxQw405k0JDQgidLHBkwMWu
 l5pfqBoCJILt7eDexBBLZ3Gop9tY/Hn6m3nZ+aOjExj2/5S7UhYBy4XXH9ET7C4fL5NCpq4n66m/V
 3iccIGdazu6x/UcPoovWoouBiJyPXCsFrT5OojnHhj5rvTgP0HzViQ3PjoQXVCwSUh69p1AHHZI4v
 9WyBtLbYNVKzuB837kOSI0ci;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZdlx-000847-MV
 for samba-technical@lists.samba.org; Tue, 26 Nov 2019 16:33:05 +0000
Subject: Re: [Samba] moved DM config to new server : gids different etc
To: samba-technical@lists.samba.org
References: <dd441242-3a01-dcbf-f112-1efeeeab1d2f@xunil.at>
 <vmime.5ddd50ad.6cee.6bf466bb7a847efd@ms249-lin-003.rotterdam.bazuin.nl>
Message-ID: <cb5e44c3-3c6a-6078-f81c-0c24cfd7dcd4@samba.org>
Date: Tue, 26 Nov 2019 16:33:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <vmime.5ddd50ad.6cee.6bf466bb7a847efd@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 26/11/2019 16:19, L.P.H. van Belle via samba-technical wrote:
> Hai Stefan,
>
> Remove the netbios alias and then put that as CNAME in the DNS
> Verify if the server its PTR is set also.
>
> And yeah, your totaly correct that your ACL is messed up..
> Because your using backend RID.
>
> The "advantage" of backend AD.
> Consistent IDs on all Samba clients and servers using the ad back end.
>
> Which is also the DISAVANTAGE of RID.
> IN-Consistent IDs on all Samba clients and servers with RID.
>
>
> Maybe im bit wrong here, with recent updates, .. Then Rowland will correct me.. ;-)
> But this is exactly why i ONLY use AD backends.

Using the 'ad' backend gives you a few advantages, you will always get 
the same IDs everywhere, including DCs, you can set individual Unix home 
directories and login shells.

If you use the 'rid' backend, you must use template lines in smb.conf, 
so everyone gets the same home dir and shell. To get the same IDs, you 
must use the same 'idmap config' lines on every Unix domain member, but 
they will not affect Samba AD DCs, the IDs there will be different.

Rowland



