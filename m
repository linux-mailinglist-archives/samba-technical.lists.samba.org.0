Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D45B6A78BE
	for <lists+samba-technical@lfdr.de>; Thu,  2 Mar 2023 02:16:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qOy046NXaXs8sHFhhI1fn5+IeJpvNRbwn57WLq/WnHU=; b=sZux2Wr+LB1SapqJPZIptssr88
	V9VMoX2d8GVd7eAo/vWpSDGjywbfHARJt3kA2tI1YbO8Z6ugmb8kioJf7optXYUMjXegnKKLFCOsx
	13IkO24djHsP8tJ88IruN5kQcWfBpPOJcc2uUb0IX5rKycVTjL2D6biIKQkE6GkyGIjMjhlNAZ5Hm
	LTz7afSoTL+FqCRMtsnWis8tl+SrjXjAjiDxhShoyrvyFDnM0nbrygh9swAXobrE4jD2VCQTjsxQc
	24gRwpZ+Wbzyi5Dn+CjcDm0xF3pxCxyjsrD2TNPOmvepqD4dEy7hSdYW0wzGcFeLpOoeQhCjyzUks
	gy5pMdFQ==;
Received: from ip6-localhost ([::1]:51860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pXXYF-00GnIM-DV; Thu, 02 Mar 2023 01:16:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36744) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pXXYB-00GnID-JP
 for samba-technical@lists.samba.org; Thu, 02 Mar 2023 01:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=qOy046NXaXs8sHFhhI1fn5+IeJpvNRbwn57WLq/WnHU=; b=UPorRbmY5QPlZIjrUp/knALD56
 8pg/KBPh6sJhuIAcadLqOv7/KaKP+AoohEMzEMhgsHxHOWmvmigTLGe/UHnWuVOmai5Hcu192Olli
 IKnyvrGQvpApbPSAY0iVZ9iO3+N1KK0ZHC95rM0stnTfXnE5zQ+Q3fGGwKgKcFT/9JdiyIPgxhqWr
 63wNWf2jVUPSNXGboY66vB9dAY0UiatXkZaV1Fyf0mQRRDmRpVhH4nXP4Q8RmINEYyYZ8wIGcJySt
 1tas9a71qtJE11OswOWXPfWuL33qhicE04rqO6cqGuLWSDQn2zQ+4qrkAfkjo61i4i3wthaa6E+G2
 GItKdnDATPZNPauTIUzPaq1xSybmpg+OEPb8SuxYxsZhnZSmnMMnPRa60sUGvLJnDxG46TsAfOBxZ
 RkLcED0TmpL5RMs7VKNMXHXIJVjef2I7m//c/H4hCR7NXfUkiBC05uZMLmLMK7KhkxABQBtTkVd7G
 9LbaHtr8iaEf4yTKjUzE8PgO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pXXYA-00HK9r-FM; Thu, 02 Mar 2023 01:16:02 +0000
Date: Wed, 1 Mar 2023 17:16:00 -0800
To: Daniel Fussell <dfussell@byu.edu>
Subject: Re: filesystems mounted within an SMB share and
 REPARSE_TAG_MOUNT_POINT
Message-ID: <Y//40Oza+O5cjKNL@jeremy-acer>
References: <CAB5c7xqGsk9sVE-VH7=Q_A3eCntO-0BDDs1+f_+gQbtxfLU2wQ@mail.gmail.com>
 <Y/+iwsLNkXEzLzu8@jeremy-acer>
 <a594f91e-6dc9-79ca-8e88-32531668aa18@byu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a594f91e-6dc9-79ca-8e88-32531668aa18@byu.edu>
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

On Wed, Mar 01, 2023 at 05:51:54PM -0700, Daniel Fussell via samba-technical wrote:
>
>I've got a new student employee forward-porting our patch from late 
>2018/early 2019 for mountpoint detection and setting 
>REPARSE_TAG_MOUNT_POINT.
>
>Our first porting attempt didn't seem to work, I'm guessing because of 
>the rewite to use *at() and different code paths.  We'd love to work 
>with you on this.

Well the first thing to do would be to make the
code available somewhere we can get at to look
at it. Github or Gitlab would be a good start !

Thanks,

Jeremy.

