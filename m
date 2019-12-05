Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC181144D2
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2019 17:27:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=gVUXXX3BxRq1InJnVkpsMSJ9UxzmQNhn7Vxooasp1wo=; b=0iAvM3PX7P28faG+2qrE9omW3v
	aRBg1ZGNsfTXjAl8yQQelm/9XDnbxBEqtHEolx3/CoZvYBAl3HimvMfWuJdeyMzKJq0vBJ+R5kF2J
	Pzk3soiwUMVLA7l7maxjtWLOC5HSlk6XaoQLXO6K+rKt7bKZyXAu0dp55P5by/VuVume6pB78RHgz
	Prl59xwPTbiANICCvJ1677ZV0csso77pOhhZSAVcmFlWpxFNWCbDCFkNcOGoBsNdeyLg6gsdrtS4D
	eJv3A/Tnnj7PeyOvKYlSzl0PY1TnTfX6ecpuxSWDYbrCbOY2n2yhXPlVoupuswLZ+3Ui1XPd/af0k
	uRMpq3uw==;
Received: from localhost ([::1]:47000 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ictxa-006DCJ-L4; Thu, 05 Dec 2019 16:26:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37056) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ictxV-006DCC-Pk
 for samba-technical@lists.samba.org; Thu, 05 Dec 2019 16:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=gVUXXX3BxRq1InJnVkpsMSJ9UxzmQNhn7Vxooasp1wo=; b=1KJndHlw86a0xUpTVtdlhofl1o
 LX6oazYA+zKQnYlVewdCzBMFrMiVh5nwZ/p6A2mUfTLJFAABCHzcZcTRI+X++mgWiKKsov70XFnZG
 ynQFVjpG87PA8oUkDv08pClD65Onis9hxVRvB3FntLhR0EiMZExlbv5FERlLzzUrcFZZrMsx0Hcqt
 d84bS3PVulkeg/g69TKOv9ffwo3djEArM3C8cUY4wc4UKPxpZqC/slxINy92XumWuXr3l9j4tCfZO
 OFUkd/Co+VgDLFidvhle2+YipOtO0aaEvPBAiWC/+pa4P30yOEJyETpyQWStOLe+Kfih/qrixl9i0
 w6iXf20IhnvxMvAmIDoWxsvbt5DHhpjmocRtBXCemL0XQPLQr8qOOYt7HDnNVngpUQqIKoN1GeZOM
 GawZnDXOXMLm8oct9YdWEVEMiM6sbXVv6B23G1WamWvzGdGKAjp7gNnqyfaV0sp1wiDUu/PV+63Wu
 vkpMpsHl2H3IjrGWWRq1Vjo4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ictxQ-0005uH-Ka; Thu, 05 Dec 2019 16:26:25 +0000
To: Nico Williams <nico@cryptonector.com>
References: <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <20191121223908.GC26241@localhost>
 <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
 <20191122224526.GA28614@localhost>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
Message-ID: <8b72197d-2fcc-5b4f-4392-12d53d1ec624@samba.org>
Date: Thu, 5 Dec 2019 17:26:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191122224526.GA28614@localhost>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: "heimdal-discuss@sics.se" <heimdal-discuss@sics.se>,
 Viktor Dukhovni <viktor1dane@dukhovni.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Greg Hudson <ghudson@MIT.EDU>, "krbdev@mit.edu Dev List" <krbdev@mit.edu>,
 kitten@ietf.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Nico,

> On Fri, Nov 22, 2019 at 11:24:44AM +0100, Stefan Metzmacher wrote:
>>> Correspondingly and symmetrically, the right way to request some
>>> behavior on the side where the credential is available, is to associate
>>> that request with the desired_name for which the credential is acquired.
>>
>> So you mean we need to pass an explicit desired_name to
>> gss_acquire_cred_from() and use gss_set_name_attribute() calls
>> (for no_transit_check and iterate_acceptor_keytab) on that desired_name
>> before?
> 
> Oh, wait, right.  That's not going to work when you want a default
> credential.
> 
> Alright.  I've got a nasty cold and can't think straight, and deadlines
> to meet to boot too.  I'll respond more thoughtfully some time next
> week.

I hope you feel better again:-)

Looking at the gss_acquire_cred_from() prototype:

 GSSAPI_LIB_FUNCTION OM_uint32 GSSAPI_LIB_CALL
 gss_acquire_cred_from(OM_uint32 *minor_status,
                      gss_const_name_t desired_name,
                      OM_uint32 time_req,
                      const gss_OID_set desired_mechs,
                      gss_cred_usage_t cred_usage,
                      gss_const_key_value_set_t cred_store,
                      gss_cred_id_t *output_cred_handle,
                      gss_OID_set *actual_mechs,
                      OM_uint32 *time_rec)

I thought that additional cred_store elements would also
be a way to modify the resulting cred_handle.

On a similar matter I'll soon need a way to modify
a GSS_C_INITIATE cred_handle that forces KRB5_GC_CACHED to
be used, so that gss_init_sec_context() is garanteed to
avoid any network usage.

Any hints would be much appreciated:-)

Thanks!
metze


