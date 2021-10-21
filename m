Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5086436863
	for <lists+samba-technical@lfdr.de>; Thu, 21 Oct 2021 18:53:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=oE/tKRAINwOFO71/SOYsu0h+uk/m6+DWbHKz1MeJWuc=; b=jTyF71hWh4Ux6K5hQAk0ll35Yn
	9PGRVN9FNnOcC0XXcSsexX/z7LD7E6BSnzq9gt8NszG7ZPWi+JltW08tYECOuvumU8GSbinZOZ1uN
	c/PeEhKpmPBAcGGMVJX6xrmkbDVjrhNgEcZGdlLsqVEPTOz24GIyiKoE6n6jG2IGI1A8POeqEt6Tf
	6XEADhi/e7EypkTdHHqLFFfnryB5mPre/BG7xPnallQE70LGWrEgopBuerNxETzYnpQhaSOPKdnQR
	i+Mw6bYvUuuWOxMDUMZDTLsjKLF5O3kizJuNl2efwJ5mo7QUtt+t8elhrPy5FmHj+GtG08f92M6MU
	tkA13o2Q==;
Received: from ip6-localhost ([::1]:58094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mdbIm-00AyCd-Dd; Thu, 21 Oct 2021 16:52:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53355) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mdbIe-00AyCU-Fv
 for samba-technical@lists.samba.org; Thu, 21 Oct 2021 16:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634835133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=ftMWW6DBW15p07wH/yvnC0bGuVw31P9LQvyNaS7YIzY=;
 b=TFWMsJIIB/D92SLdElWNNwrfIKT8u4rOz7ymuiNrZHFja/EYPlvcS0o/75YZ7vkM59NgCX
 Ub4jN4ViN4RaxYZnB47aIjliM37HdEqHZLpP8Z1/029ZQ4Rc+wlSW15y4OF365UndGszjb
 JNIWfxwmcxrAjnbExq+ANpl/YH/J37A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634835133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=ftMWW6DBW15p07wH/yvnC0bGuVw31P9LQvyNaS7YIzY=;
 b=TFWMsJIIB/D92SLdElWNNwrfIKT8u4rOz7ymuiNrZHFja/EYPlvcS0o/75YZ7vkM59NgCX
 Ub4jN4ViN4RaxYZnB47aIjliM37HdEqHZLpP8Z1/029ZQ4Rc+wlSW15y4OF365UndGszjb
 JNIWfxwmcxrAjnbExq+ANpl/YH/J37A=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-jTsPfoyjMaOWuTbzCr58Fg-1; Thu, 21 Oct 2021 12:35:47 -0400
X-MC-Unique: jTsPfoyjMaOWuTbzCr58Fg-1
Received: by mail-pl1-f199.google.com with SMTP id
 w8-20020a170902a70800b0013ffaf12fbaso425084plq.23
 for <samba-technical@lists.samba.org>; Thu, 21 Oct 2021 09:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ftMWW6DBW15p07wH/yvnC0bGuVw31P9LQvyNaS7YIzY=;
 b=gOrEX1RG1aGS0p7Q4ns6TKeVwMlnIzHCSOeM+xh2rSvbtQetYrE+X44+WGzvhk1kJ1
 iC2vmI0FO0anuh6E72Ruco8t3Rt/XX9B2dV/cY7hcAIHoqRh6S+/G8Ea5k0dLUsmdj7K
 ImZpMMUUpxcECXkLH8FIOQbS911Xj2ynXE3q3wTAFbpofwNos5WsncO7lwGoqZNprZhw
 x+P2SEpRtW4hP4G/j9z7rrPodEz8ne5hrYCKQzCwgEpLIAp1+hz7l2sPF5lJUom7YEYE
 e/02FwqVxdyyBb2vxnre9wS4bnoYO14uprjSBghYXllJ1nEKRpAAJp+G8o/cF57fJAcd
 nT6w==
X-Gm-Message-State: AOAM530wYQpJXyGp1i5JVz7nmp1xxc8LRfAaEs4gWvOUKpJd/MO3IMTP
 h13UrixeKdNNQkAQBmZe6neLlxATPUqY7YFnCa06fHsY6EFL9ZNQmDCtoVk/J5j3wWwR+ME6HuE
 dUhfbJ0yONA9OBa/i/bAXynnL8yxTE/GJPG8mNDMKeOCn
X-Received: by 2002:a05:6a00:888:b0:44c:c00e:189c with SMTP id
 q8-20020a056a00088800b0044cc00e189cmr6515289pfj.79.1634834146153; 
 Thu, 21 Oct 2021 09:35:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1ZcSswbTGy4R/fVvoGjHPrUw3l2KWPPtwzX9uAtht4zj2tQ+pYD3WQbXuZMdTUti+kiRxLrGNh2i4XjCQm5Q=
X-Received: by 2002:a05:6a00:888:b0:44c:c00e:189c with SMTP id
 q8-20020a056a00088800b0044cc00e189cmr6515250pfj.79.1634834145640; Thu, 21 Oct
 2021 09:35:45 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 21 Oct 2021 18:35:35 +0200
Message-ID: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
Subject: directory with a symlink pointing to non-existing file
To: samba-technical@lists.samba.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pfilipen@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Warn: TLS-SNI hr1.samba.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Pavel Filipensky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Filipensky <pfilipen@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

if on local linux file system there is a directory with only one file - a
symlink pointing to a non-existing file then:
- from SMB point of view the directory is *empty*, such symlink is not shown
- but SMB does allow to delete such *empty* directory, it gives
NT_STATUS_DIRECTORY_NOT_EMPTY

This is seen with samba 4.10 and 4.13. Could there be a difference with the
latest samba?

setting those smb.conf params has no effect:

allow insecure wide links = yes
unix extensions = no
follow symlinks = yes
wide links = yes


How to approach it? I can imagine these:

1.  Do nothing. A symlink pointing to a non-existing file was created
without involving SMB, so we should not blame SMB and instead make sure
that such behind the scene manipulations do not happen...

2. Implement fix to allow deletion of directory which contains only
pointing-to-nowhere symlinks

3. Implement fix that puts also pointing-to-nowhere symlinks to directory
listing

4. Provide better info when deletion of* empty *dir fails with
NT_STATUS_DIRECTORY_NOT_EMPTY. How?


Cheers,
Pavel

P.S. There is a related BUG: https://bugzilla.samba.org/show_bug.cgi?id=5209
