Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2120F19BF17
	for <lists+samba-technical@lfdr.de>; Thu,  2 Apr 2020 12:09:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=DN8OspKQ2N/h4rq2SEz/Gs6pUdiHgCrEoK9Bk7Aj9B4=; b=dtBu+3PZ9hSo4kj9llfKnhyKl1
	swaeDcMOQ1Vu2qm9soqybluHh4Mww/Et463ik+SfXnsUkL6NE7gIksr9RNpRRLtuXAgqDtg5dAPq6
	pTux8DC405uml06T2mX88LH7T/0PRqIJpdCiU4U0Kj8DHdQpUEyEtywADy/tw2k8wEinIYUkGzb2N
	ElZeYjD+MuZGTXmTfpjCXysFOMlmvPGWeGvy4yX9di+C+E9Pn2r3uOshY+Rhag/fJWiGDYJ1WFOhi
	f7wlZIsXXAfVWxCbIRDdki/Dqutc61R6x5/J2l9ItkTyiCnT/+zREUM59ldkA82/xdE5UDksGF9zr
	W3cMfz7w==;
Received: from localhost ([::1]:63494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJwn6-0035yP-0f; Thu, 02 Apr 2020 10:09:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60044) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJwn1-0035yI-TF
 for samba-technical@lists.samba.org; Thu, 02 Apr 2020 10:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=DN8OspKQ2N/h4rq2SEz/Gs6pUdiHgCrEoK9Bk7Aj9B4=; b=KYizPzNmzEYv94Hi/DOx5/FOxJ
 oJM731v0POveSi11J/WGVTdTskXmH428awXiAUofFTkIvoccgE+axgmmByfw2kTJ/6Mj5aUzo9qFy
 3DFoRf6jTBETrQ8VXIketoSS0f2pSpG4joV8WTr5ix8qMJbzYvy3MqrKmyrxLNALJkmtuiI37ZMM4
 ygtUPWTYBU26XN85eEe/uBWzQqx9XjuUY/ovPksRF3caKecrTrZOrBfBpor0s6EuaMl9yS2IPUmOS
 df9fUsRMpbln34tGwkL7eNWJzVjk5fv+F2I1DjTuYCYHOYr2mdgttpG6zXvPLGy5BJ2uOK3IY0rbM
 2N+tuCxpF++IUa8nYq18yWk1shXsPkmCoPMSpfQ5LsnXtM7dhfPOUnCJGi2j/YGetQwhExJQ3ZG5p
 7Cp4RJjxjxNVHXLujADjPxpYGFBZjBv4ol/dVNZGU8Dhkluc42ucVP0ejunQF0M2WO0UXm9xBjSy/
 M/PvhH16ER0LP/hPojlxDafw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJwn1-0000Hk-7c; Thu, 02 Apr 2020 10:09:35 +0000
Date: Thu, 2 Apr 2020 13:09:33 +0300
To: =?iso-8859-1?Q?Bj=F6rn?= Baumbach <bb@sernet.de>
Subject: Re: [PATCH] samba-tool group show
Message-ID: <20200402100933.GY2735275@onega.vda.li>
References: <0acb2828-a298-4a79-421d-683a771d9a93@samba.org>
 <9a67100a-d672-5765-227e-641ced43e683@sernet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a67100a-d672-5765-227e-641ced43e683@sernet.de>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 02 huhti 2020, Björn Baumbach via samba-technical wrote:
> Hi Rowland,
> 
> On 4/2/20 10:44 AM, Rowland penny via samba-technical wrote:
> > Hi, <samba-tool group show 'groupname'> will only show the groups info
> > if it is a global security group.
> > 
> > The attached patch fixes this.
> > 
> > See bug: https://bugzilla.samba.org/show_bug.cgi?id=14335
> 
> Thank you for fixing this!
> I wonder about the use of "objectCategory=group". I would expect the use
> of "objectClass=group" instead. But I tried the patch and it works - I
> did not try to understand why, yet. The objectCategory looks like
> "objectCategory: CN=Group,CN=Schema,CN=Configuration,..."

objectCategory is one of several special attributes in Active Directory
that allow several formats for searches. objectCategory allows both RDN
value and DN-based searches while being itself a DN.

This is documented in MS-ADTS 3.1.1.3.1.3.5:
https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/e1c068a5-eb1d-4f62-ab3b-81218472cb57

> I checked the samba-tool code and see that we typically use the
> objectClass attribute.
> Is there a special reason for the use of "objectCategory"?
> 
> If "objectClass" is also fine, I would adapt the patch, add my RB and
> push it.

This is covered in https://social.technet.microsoft.com/wiki/contents/articles/5392.active-directory-ldap-syntax-filters.aspx#Filter_on_objectCategory_and_objectClass

For groups there is not much difference but since objectCategory is
both single-valued and indexed, query with objectCategory will be more
efficient in AD DS.

-- 
/ Alexander Bokovoy

