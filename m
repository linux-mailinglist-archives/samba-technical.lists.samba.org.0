Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C7D24A5AF
	for <lists+samba-technical@lfdr.de>; Wed, 19 Aug 2020 20:13:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ywL5nOzXlwt8EqE3rYZ0J3o5E6+He4eWSu52aBO51IY=; b=kPp97z18faeIWA/KCNU+sFxDAc
	X5ABtWMudjvhflpUAv7NA3WTkQThpVtB3kLnVUHDz6bfY1DzfN9ZhnTOyeLZHHREZ7hSPQB/1Xur/
	mc65WmmU8euRTpdZSQYnflMIngA1ne+2GH+14iHVZwq5o/gr7jJ+Q1BFyeQPYiAdnaoHSs40TMpRY
	2QrppWr2FlB/PaeUpJ/W4R3DCHggW6QDfZ74+74a0hCw5X7On4BSSZx4csxpiCjMu09lhbaUHGLg/
	7CSTIKQqTX3TTN51m1oHehtTWQQjZ92GHQKx52PEg5zHuanMoJeXtnOxkwpmi+3gmdXJjBxVt6E3k
	JrfR+Gzw==;
Received: from localhost ([::1]:31566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8Sa7-00EIqe-05; Wed, 19 Aug 2020 18:13:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59416) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8Sa1-00EIqX-E9
 for samba-technical@lists.samba.org; Wed, 19 Aug 2020 18:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ywL5nOzXlwt8EqE3rYZ0J3o5E6+He4eWSu52aBO51IY=; b=Nf2Jw15Ev+ylZmNm2IZ678LqpV
 dCC+hq0gzGpWnzMyy35MrKxcziMdL4n4X/xf9ZjLK5YSm6fG++rCB7uIJFWEm3qAKfPI/IWdAsaF/
 6P0jqmV2Bas5kB/O531HaBnBm6hwpcc78+FHYB/IAtVc6aK/FB0aCAvjJhxLJkjU+H1opLqAXMrK4
 bodff2EYTgSY7AUtvEK4m8tAwPfZ934mf4l47+Ec8kfPkFVR4h1tFjzi4HG6dv789E5sgQwvoThHR
 Q+oWAsVCMDheFLbQGgwK8Q0EYm7acCYzlQjBCxM6+JbPrbqf/vagdsv12UgdxlCYfpgSgLLtLE5rr
 CSoZ5Rd/Ur0KZ9wrhUlm5lYW3UDqu0+GzhMI5MUCTxLv2wT+PO4v1U0RarIrzkbQuKGUfjOkMie7J
 N9BNjCVaKPk20QtoZhlUH8DmMHo3dyhVGXWVmfagcWIXge4MwtUmiJBvB6KdNsuI+5C7KszM4A3Vl
 2JgVudkIAJsBd6ci3lH+znI2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8Sa0-0003eo-1b; Wed, 19 Aug 2020 18:12:56 +0000
Date: Wed, 19 Aug 2020 11:12:50 -0700
To: Pavel =?utf-8?Q?B=C5=99ezina?= <pbrezina@redhat.com>
Subject: Re: tevent: fd events do not work correctly for UDP socket?
Message-ID: <20200819181250.GB23121@jeremy-acer>
References: <6c7d3f9b-240b-c022-2672-7dd493922050@redhat.com>
 <20200818163118.GA8897@jeremy-acer>
 <84f904bf-0a67-4595-2ab0-de4fa021a7a5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84f904bf-0a67-4595-2ab0-de4fa021a7a5@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Aug 19, 2020 at 07:15:13PM +0200, Pavel Březina via samba-technical wrote:
> 
> I see. If I understand it correctly epoll returns EPOLLERR and the code hits
> this [1] line?
> 
> > I don't think this is tevent specific behavior.
> 
> If the above is true then tevent should provide way for the handler to check
> for errors or don't call a read handler on an error so read does not get
> called.

Calling read() and getting an error *is* the way you detect
an error here.

Remember, doing the connect() on a UDP socket didn't
send anything over the wire, it just set up the association.

When you do the write(), then you're actually asking
for something to go over the wire, and then tevent/epoll
can actually know there was nothing listening on the
other end.

