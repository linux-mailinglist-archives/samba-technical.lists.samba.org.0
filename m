Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6ED6E5A19
	for <lists+samba-technical@lfdr.de>; Tue, 18 Apr 2023 09:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dagRcYHUjdDUCWadoH5/3Ry1ybqxeFIzzlqg+eYBSuE=; b=ndJ5pvIry1hJJLZ5OdShmMMdLq
	r1V8Gv9dAHFHWSWTitbTTEnG1dpFMS9qao0ZfWKe1cEzA6qYUXmt46irlJYloriwCaYVMmmD5fQ9L
	Iu0YXfFtbyiFMnTNIYjRNevAG2bXVMt/ZVbUdQCA5j9EOmwzZwKnrkry/8Mpu6fGYEUGXPv0GGOW6
	Pabb6LfELOSgqNWkOsdUdWVOL716RbryKtrx4whkU11P5C/95A9t5LtVd0F+du1pci7cMCZfnLB3t
	KK0IN0Gg4XyIvrrUdY6Gh9OTxXkZnMF9vxchyTlwlXAssCBdmoWkol6kkkjOsMecT79Ksi+E9DN19
	YNzNZIIQ==;
Received: from ip6-localhost ([::1]:50966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pofS0-002PXl-T4; Tue, 18 Apr 2023 07:08:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24474) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pofRm-002PXb-FT
 for samba-technical@lists.samba.org; Tue, 18 Apr 2023 07:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681801689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dagRcYHUjdDUCWadoH5/3Ry1ybqxeFIzzlqg+eYBSuE=;
 b=YIwF/BJcGQUGZ+zhIaEhc46PrXQI9tQA0SRCDN3IK08ZzxyqUJL5Vomg1Thn5UFFyrBcYg
 Qfhgi8CTG0MaziNQk46rOs5vuQqLPTmRINd8/EN3FOvQsjMcOtfhRQSxhL/t0+NbmSVhMA
 9zriN4bi4EBD9lu0wIDxyE6QbatGHCA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681801689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dagRcYHUjdDUCWadoH5/3Ry1ybqxeFIzzlqg+eYBSuE=;
 b=YIwF/BJcGQUGZ+zhIaEhc46PrXQI9tQA0SRCDN3IK08ZzxyqUJL5Vomg1Thn5UFFyrBcYg
 Qfhgi8CTG0MaziNQk46rOs5vuQqLPTmRINd8/EN3FOvQsjMcOtfhRQSxhL/t0+NbmSVhMA
 9zriN4bi4EBD9lu0wIDxyE6QbatGHCA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-Mo6FY4BdPieN5yH5P7BP_g-1; Tue, 18 Apr 2023 03:07:38 -0400
X-MC-Unique: Mo6FY4BdPieN5yH5P7BP_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 614901818E51;
 Tue, 18 Apr 2023 07:07:38 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5DB62A68;
 Tue, 18 Apr 2023 07:07:37 +0000 (UTC)
To: Andreas Schneider <asn@samba.org>
Subject: Re: talloc vs malloc speed
References: <3161922.5fSG56mABF@magrathea> <5829842.MhkbZ0Pkbq@magrathea>
 <871qkigw1g.fsf@oldenburg.str.redhat.com>
 <3558714.R56niFO833@magrathea>
Date: Tue, 18 Apr 2023 09:07:35 +0200
In-Reply-To: <3558714.R56niFO833@magrathea> (Andreas Schneider's message of
 "Tue, 18 Apr 2023 07:54:43 +0200")
Message-ID: <875y9thdmw.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
From: Florian Weimer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Florian Weimer <fweimer@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

* Andreas Schneider:

> On Monday, 17 April 2023 21:15:23 CEST Florian Weimer wrote:
>> > The malloc attribute can be set to a few functions, that helps. I use
>> > the attribute with the deallocator to avoid issue on free with
>> > destructors.
>> 
>> I *think* that should be safe, but I'm not entirely sure.  Maybe ask on
>> the GCC list?
>
> Is it valid to set the the malloc attribute for talloc_strdup()?

It depends on how it's implemented.  If it returns a fresh pointer
aligned like malloc would, it's appropriate.  The <string.h> header from
glibc uses it for strdup, too.

Thanks,
Florian


