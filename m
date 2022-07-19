Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFDD57A3B0
	for <lists+samba-technical@lfdr.de>; Tue, 19 Jul 2022 17:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=9TtsvaH1htZGmHAxQuHjVARwH0qXPCYgxmFm2W9nEak=; b=40GliDsuTVR3rPtIDyUM+QBXCS
	qoYKRtE0Cjj/lQCyTZDV0KXGayOvBl7BEuXN3lCCHXF2bVDls2djX+XkmfQtiFOBcX2Wza4qvq9P+
	aPBZ/9W1+RaFOJu+Hnlgsj1F2FQhl49nlN5dVsi0UGBplJQUUVujzEVvhrmNu2Am5/wha6/1PmY1E
	eDrcSey5wC1imDgMMmYwEfFwS+I/PcwQ04eRNF5JbDTG3mApj8NaZOK0USyyq+wrQ9hB9XWtzxhwJ
	PBXh0mv5loYhf+R8L9U0bLk/hZ8r3iWlO2xB1k8h8NmI4NQkTl0p0BTJP+TMkQ44d9GDRKVSJZyNI
	7CkdSbYg==;
Received: from ip6-localhost ([::1]:56746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oDpUU-000t5T-8F; Tue, 19 Jul 2022 15:50:30 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:33486) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oDpUN-000t5K-GM
 for samba-technical@lists.samba.org; Tue, 19 Jul 2022 15:50:27 +0000
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-31e47ac84daso45243597b3.0
 for <samba-technical@lists.samba.org>; Tue, 19 Jul 2022 08:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=m0SKu8V0H8FHaLfF9gDfVdtD74BGHrF4tQ+tRO3MRFA=;
 b=NBy+VuBBUqzVLr0BkmcSYSih51GWjG9/gg1C0RsWgtW3LTJqry5zgi3rYgTtjwA4an
 Tjn3tSc72fPZb9TnHikCgIG+vVfyMdJgS07A4CK7gd0ksJku/WZ1Nc9Vc2onYZUJSoH1
 Df9H60r9BZhv22QCnsEcnJO2B9hbKx+EqQK4NmwfKJlT6/pLvez3W9cwBNFXz946vu5/
 r+wjdrj9tfnTbN64zk09AgU++nM1cuRYU8pZs/TSdy8BzKZ7+H4GCWBGQ3rtg8CuDuuZ
 2rZosOy4uErJxG8CRj105xucfOOPHeyBegDYROees7DPfl4m3ziao5riSW2lec4G/41o
 M4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=m0SKu8V0H8FHaLfF9gDfVdtD74BGHrF4tQ+tRO3MRFA=;
 b=SbQ3F3Y7mUAECeWrl1TJf+HR72EtJv76HHEVoH+huqyp+oVVqkQhZCWOivR82rgr8p
 1l2XFAaUMaWrZkQGKY6/ug+m4tAD+lxK7wsIEPUIGIg5/ZOOpnuwjSvXLrO6v1mOD+3E
 PWOdc0Lwhfuoa2+8ChxJCJGIRDUey9HhJuGvcYvFr1/UjZebyoaQeJdH9d9CV2LKz6Di
 pehXQEcU+4vEZ5byhfrBwQ7nnOcgtitN2TEClhbdgbumIia31IE/xSOZh6jG/IfacaBS
 pfPmL4inA7yvMdY8OMus0a9Q46fwUvGpcIK917ICgDpGrD4klUk4yK2ESOPm5DhKIhBN
 HpxA==
X-Gm-Message-State: AJIora+HHyP7fxzrutPeefTzPAcjBNje0InW1eUptw0rPHxymr2X3nRZ
 ijCUwK3q5EZk3B3rdwpah7G9XvNegYsNxVrjA17HgrUrXOQ=
X-Google-Smtp-Source: AGRyM1t5t+AOqSWNldcmYnfU9om3K1VkMZ7wIPEx7wcJGiPBpzAiL9pYp/O6EKsXlqlu3NL77zf5H+1eE4rEPjwreYQ=
X-Received: by 2002:a81:6c0e:0:b0:31d:4367:c1a2 with SMTP id
 h14-20020a816c0e000000b0031d4367c1a2mr37373028ywc.433.1658245820467; Tue, 19
 Jul 2022 08:50:20 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 19 Jul 2022 21:20:09 +0530
Message-ID: <CAHbM3qimf=1xi0+UMZa5QFKDr0_JdHz2MF=T-bMBO8ZAhuzP8A@mail.gmail.com>
Subject: Issue if SearchResEntry and SearchResDone CLDAP responses are in 2
 packets
To: samba-technical <samba-technical@lists.samba.org>
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
From: Shilpa K via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shilpa K <shilpa.krishnareddy@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

We have a setup where there are 3 DCs in a domain and Samba is joined as
Member Server. 2 of the DCs run Windows 2019 and one of them was Windows
2008. Windows 2008 DC was decommissioned. Samba was joined to the domain
when Windows 2008 was available. After Windows 2008 was decommissioned, net
ads commands started failing as below:

ads_try_connect: sending CLDAP request to <IP>...
....
cldap_netlogon_recv for domain <DOMAIN> failed with status
LDAP_PROTOCOL_ERROR

Upon checking the network trace, we noticed that in response to the CLDAP
request SearchRequest, Windows 2019 DCs responded with SearchResEntry and
SearchResDone in 2 separate packets. Checking the code, it failed below:

NTSTATUS cldap_search_recv(struct tevent_req *req,
                           TALLOC_CTX *mem_ctx,
                           struct cldap_search *io)
{
...
...
status = ldap_decode(state->response.asn1, NULL, ldap_msg);
        if (!NT_STATUS_IS_OK(status)) {
                goto failed;
        }
        ZERO_STRUCT(io->out);
        /* the first possible form has a search result in first place */
        if (ldap_msg->type == LDAP_TAG_SearchResultEntry) {
....
                *io->out.response = ldap_msg->r.SearchResultEntry;
                /* decode the 2nd part */
                status = ldap_decode(state->response.asn1, NULL, ldap_msg);
--->failed call
                if (!NT_STATUS_IS_OK(status)) {
                        goto failed;
                }
        }

...
}

The 2nd ldap_decode(..) fails because:


/* Peek into an ASN1 buffer, not advancing the pointer */
bool asn1_peek(struct asn1_data *data, void *p, int len)
{
...
        if (data->ofs + len > data->length) {
                /* we need to mark the buffer as consumed, so the caller
knows
                   this was an out of data error, and not a decode error */
                data->ofs = data->length;
                return false;
        }
..
}

Here, after the first call to ldap_decode(...) in cldap_search_recv(), the
value of data->ofs and data->length was 163 and len was 1. len was 1
because of below code:

_PUBLIC_ NTSTATUS ldap_decode(..)
{
 ...
        if (!asn1_start_tag(data, ASN1_SEQUENCE(0))) goto prot_err;
...
}

We think the issue is because SearchResEntry and SearchResDone responses
are in 2 different packets. Could you please confirm if this is so?

Thanks,
Shilpa
