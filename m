Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 362DC4CE07E
	for <lists+samba-technical@lfdr.de>; Fri,  4 Mar 2022 23:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=QrPdT5/ufB9cbyY2bqk5CjrKSzR3m0/bG67J9ohzrBs=; b=pmhjUjcutkfc8+YKxLXD6k0ueD
	bu1l7BI9bPzs4NrtBgyGS+g/MyOmZF4N9RQ28QRD6SHOQj3hOzEtFwxHlwHUgfOHN94L4L9F4YDpc
	KmNVuwxkDcQRbjgJivvf/zkRpb+MISCmQ4jkANekyFhp6ZlSZF0UX1ekldFjvfFXdu6pwFsjHOhLk
	2/xAABFh5GjJ2YIg4Op4wyvqx06ICxMzm0RNmlEF/j3LzTBR/RCbCx9AgeQIkUIMwEIXNTu8txx/C
	HTsiVwHxFPqV8cKrmWfS6rWOWQJVTJiJsuDm0I3juNRctfqPDg+H7tVue1xmzY1Zw9SK1cm301LSS
	hHDVTAhA==;
Received: from ip6-localhost ([::1]:58320 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nQGrs-00G1Ys-VN; Fri, 04 Mar 2022 22:57:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49434) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nQGro-00G1YR-CK
 for samba-technical@lists.samba.org; Fri, 04 Mar 2022 22:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=QrPdT5/ufB9cbyY2bqk5CjrKSzR3m0/bG67J9ohzrBs=; b=vboqmWpR7YvWor4qeBsEd3XVry
 KgDZ1pgKpzLOJ9uQiI2v7sc5i/ZvE0rWMncJtfVbY7yxNNIrf9XtRY7NjvQyf1ZdAgqnjbsPDZew3
 KGDmztEGunYrUe8w6nQ7doln2EeJNwDJ4agMF4A7SM8m8DD9Uq5l3AU6u+gpsOr0SB19MeOWA7A5P
 YCaX+RadTOkeplMwfsjq72lLPygsLzGZqKWxqqmnGHHL/t1gVsoL/511sJAi6NeEWtvK7wtL4bO6w
 TCaFfMk5JQmx9vM2Q714ZszfzUU122WdrSEJU6gl2krERC2Kv9VjZA4p6ew+BK+SBwhfR/mbsh+4D
 67BjQdsUkZ1mq/odF2YFRUBiQz68NDNo9TS2d8TDModPg882hQD1QikKcoGF6RqyxDPntP7HeDoRE
 Tx+MC3h1eqZgdWTE1LTOd5H7EaTI4+QC+26GbZ9Mi2MagisBbW6tfSLEDmRo0OrtT25+e6EeQUEBn
 kiHrMHv3HBucKChiUXN53Pyi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nQGrm-006kyS-QU; Fri, 04 Mar 2022 22:57:43 +0000
Date: Fri, 4 Mar 2022 14:57:38 -0800
To: atheik <atteh.mailbox@gmail.com>
Subject: Re: [PATCHv2] cifs-utils: work around missing krb5_free_string in
 Heimdal
Message-ID: <YiKZYnFjAm0fbMX2@jeremy-acer>
References: <CAAQNcwukKj0fXtbFW7A3nm4QOiVG-H4L7kHG30mGkyX_eJBz8A@mail.gmail.com>
 <YiFgXtz5W26CZRbm@jeremy-acer>
 <CAAQNcwtc1SbYNxRRf6_F50sg8cYgFc4bBjxaVFxsPP+JOdU=jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAAQNcwtc1SbYNxRRf6_F50sg8cYgFc4bBjxaVFxsPP+JOdU=jA@mail.gmail.com>
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

On Sat, Mar 05, 2022 at 12:51:43AM +0200, atheik wrote:
>On 3/4/22, Jeremy Allison <jra@samba.org> wrote:
>> Does cifs-utils have a libreplace equivalent ?
>
>I have no idea about libreplace but cifs.upcall.c of
>cifs-utils already has a lot of these #ifdefs for
>compatibility between MIT and Heimdal KRB5.
>
>> Wouldn't it be easier to test for the existence of
>> krb5_free_string() and write a libreplace wrapper
>> function so krb5_free_string() can be called from
>> all code without #ifdefs in the main code ?
>
>This patch adds just another #ifdef to cifs.upcall.c
>so that cifs-utils builds against Heimdal again.
>
>I have attached a new patch that doesn't place the
>#ifdefs in the function body.

That looks cleaner to me, thanks !

