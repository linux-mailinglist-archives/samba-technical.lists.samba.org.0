Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 124F23AB67C
	for <lists+samba-technical@lfdr.de>; Thu, 17 Jun 2021 16:50:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=R66K19lwsRQwaFFrFo/rs8egBFc+D8JWz5XsXuFq2CQ=; b=sjGNeZgwsPHmPxlVh9zKgcE+LZ
	Wbh4cEWaIQL4bks/sSLFWsloOowPhMNb+oZhYoGMwuZMDnlZr42YEavC0g5VmrDTI1gpNOxn2kW/b
	p2Z5tIckANVy9UeWkHqZ4Ax8VB1+b+yhGk11QjXuRlqyZUX2C+x33/tFtaH+MaM8uQ0h/P78cGEa0
	CosdDQXjxva8Bi2aRLBoG4rVIobMMG4o9py2U7oYnap34mFpBcFvMq5EH3ifJKks5jvg4EcKhKdIl
	px5jcTnpReD43Ozr12A9RUvMP+x9RNwu+R0tWdo+vkZp7tbqF4/4zXDt1SZS5wdRBD7wrEalyZN72
	V7v1xa/g==;
Received: from ip6-localhost ([::1]:22146 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lttL7-006XQ7-2b; Thu, 17 Jun 2021 14:49:53 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:29238) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lttL1-006XPy-Pt
 for samba-technical@lists.samba.org; Thu, 17 Jun 2021 14:49:50 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HE6lm1032639; Thu, 17 Jun 2021 14:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=R66K19lwsRQwaFFrFo/rs8egBFc+D8JWz5XsXuFq2CQ=;
 b=ui7pC6MYyxhbJ/qWqUetP0Sb0qTkX39ztTK7Izndpp0p/I/CFS+fh0+9xJkPZKOr/RM8
 UwjS3nh/FXnpdDIyWLkAUQVnuEyL5GwZZyf0GTPKN9EtiQh4/YfZfR2aSB624DoVb4mi
 7Sb2V73zI59nX/vv1hEvIEIXCOW4kr55I4tfscbLswmVtcOGG2oET2e0DIHt0jTn9ynM
 7Uq8BKEUjVqHqBfMjicT2q4hr2xgui7Gm4qlOxM97AA7TU9DoUXbBDB1D3SUIi2DE+BG
 BsHlthWdVuYfoY5/Dii41i7hGWx4ogh9FE2/8+hD/I4Jkd9aAIhVLqVXfhUV4u4AbAYd 7g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39770hbe5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 14:17:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HEBLMb024838;
 Thu, 17 Jun 2021 14:17:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 396wavn16p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 14:17:25 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HEHPvn042022;
 Thu, 17 Jun 2021 14:17:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 396wavn16e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 14:17:25 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15HEHON4002157;
 Thu, 17 Jun 2021 14:17:24 GMT
Received: from kadam (/102.222.70.252) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Jun 2021 07:17:23 -0700
Date: Thu, 17 Jun 2021 17:17:17 +0300
To: Baokun Li <libaokun1@huawei.com>
Subject: Re: [PATCH -next] cifs: convert list_for_each to entry variant in
 smb2misc.c
Message-ID: <20210617141717.GF1861@kadam>
References: <20210617132250.690226-1-libaokun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617132250.690226-1-libaokun1@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: xx7frwkBPGXM1q5D5cbwXhDGpSRpkqZK
X-Proofpoint-ORIG-GUID: xx7frwkBPGXM1q5D5cbwXhDGpSRpkqZK
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
From: Dan Carpenter via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 Hulk Robot <hulkci@huawei.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jun 17, 2021 at 09:22:50PM +0800, Baokun Li wrote:
> @@ -628,9 +624,7 @@ smb2_is_valid_lease_break(char *buffer)
>  
>  	/* look up tcon based on tid & uid */
>  	spin_lock(&cifs_tcp_ses_lock);
> -	list_for_each(tmp, &cifs_tcp_ses_list) {
> -		server = list_entry(tmp, struct TCP_Server_Info, tcp_ses_list);
> -
> +	list_for_each_entry(server, &cifs_tcp_ses_list, tcp_ses_list) {
>  		list_for_each(tmp1, &server->smb_ses_list) {
>  			ses = list_entry(tmp1, struct cifs_ses, smb_ses_list);
                        ^^^^^^^^^^^^^^^^

Please convert this one as well.

>  
> @@ -687,7 +681,7 @@ bool
>  smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
>  {
>  	struct smb2_oplock_break *rsp = (struct smb2_oplock_break *)buffer;
> -	struct list_head *tmp, *tmp1, *tmp2;
> +	struct list_head *tmp1, *tmp2;
>  	struct cifs_ses *ses;
>  	struct cifs_tcon *tcon;
>  	struct cifsInodeInfo *cinode;
> @@ -710,9 +704,7 @@ smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
>  
>  	/* look up tcon based on tid & uid */
>  	spin_lock(&cifs_tcp_ses_lock);
> -	list_for_each(tmp, &server->smb_ses_list) {
> -		ses = list_entry(tmp, struct cifs_ses, smb_ses_list);
> -
> +	list_for_each_entry(ses, &server->smb_ses_list, smb_ses_list) {
>  		list_for_each(tmp1, &ses->tcon_list) {
>  			tcon = list_entry(tmp1, struct cifs_tcon, tcon_list);
                        ^^^^^^^^^^^^^^^^^
And this one.

regards,
dan carpenter

>  

