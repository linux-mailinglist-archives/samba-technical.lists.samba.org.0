Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8515A4FC393
	for <lists+samba-technical@lfdr.de>; Mon, 11 Apr 2022 19:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Xo16GBYUDK4jDbSYr4gIb03AT9QiaSP0NZTk2SebSoU=; b=kTAX2cuO4eBjkCGwb87b3v7g5P
	Ytb6jelBfMEh9cNOe++Vr91z3lcDH29SHAm03F8vcejoGZ1F0zzfLoKt3C05L7mkGMS6v17vr+UD/
	JMfanvva1pjryrvaIuc9v7GYv8trMx230DUunBMbygDbBLlYHEQK82TAjkf2OoQxfjfsiaAI+CKCb
	7S6yeFS07mQIjuAfFnOFbLVNywa6yj6nn685/TjdFgILOOb38dTZBeycTCm/3biiIDNpfPJVpQ3Cb
	5TL9CwmKcVsfrLy3eMuqkxtpJhGEYOn9SQxO6qYb8iCeTlGEVuYOxZoVXnD3c+y9bDOyqb0cNgGQ4
	Oj+Y7uJw==;
Received: from ip6-localhost ([::1]:60434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ndy0Z-00BWqm-1m; Mon, 11 Apr 2022 17:39:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35055) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ndy0S-00BWqT-FB
 for samba-technical@lists.samba.org; Mon, 11 Apr 2022 17:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649698752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xo16GBYUDK4jDbSYr4gIb03AT9QiaSP0NZTk2SebSoU=;
 b=ZL/O3PRYPGEnUP7vsKECRxVkcxKwFWO/IQk1duf8bNTCvgepcbf2CgAqWOuISzP6YtnbiL
 aNqvzlHPUk/EbvlrdU02Qn8B6PbN9pb8WDP20YnrVQQiNJJwVdF1iiaeKDgRF3azM9R4J/
 rpbX59p6KyzGZMTbLGu4qd79AJRROkQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649698752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xo16GBYUDK4jDbSYr4gIb03AT9QiaSP0NZTk2SebSoU=;
 b=ZL/O3PRYPGEnUP7vsKECRxVkcxKwFWO/IQk1duf8bNTCvgepcbf2CgAqWOuISzP6YtnbiL
 aNqvzlHPUk/EbvlrdU02Qn8B6PbN9pb8WDP20YnrVQQiNJJwVdF1iiaeKDgRF3azM9R4J/
 rpbX59p6KyzGZMTbLGu4qd79AJRROkQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-DId_zIbXPxy4_9hTv-cjsw-1; Mon, 11 Apr 2022 13:23:04 -0400
X-MC-Unique: DId_zIbXPxy4_9hTv-cjsw-1
Received: by mail-wm1-f70.google.com with SMTP id
 y11-20020a7bc18b000000b0038eac019fc0so4657502wmi.9
 for <samba-technical@lists.samba.org>; Mon, 11 Apr 2022 10:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=Xo16GBYUDK4jDbSYr4gIb03AT9QiaSP0NZTk2SebSoU=;
 b=QyG8BGsHArDp0+aO9tm6ZDkY/wercMOGk7JGpo3fYFGTjU+W6xeMJr1koiamzKtwtA
 djJrusRTFNXTYtKAwE4BKiHuBu7RWA1S2zAy8I2cGS/IF1gICS/MswjRWB65zIDaoip2
 WkmjV2XHu+PHMa1ivR0c5U3cS6/tjikpcOP5i9ZgPufQRTI6h7tNpTeI4C0yhcayisdU
 ra3RSSLh7rBg23h3pzKf7p75ew2Fkk4Bas91EvX7kyJAC/DLqXtp0YuHclx4FqHX298q
 S8aBmnQYOC5I7Rn9gJmUArvRVbskeg3scYvPF4dzXO1sHnwLp6LVRSDqVO6ElTcfvHD3
 Z6Sg==
X-Gm-Message-State: AOAM533mlNY8f5UsC9YGpSiselTDkVmtah74/6LihEmVN/n5xYpqf+0S
 fPKs2PI+DBTjI0/Gcf3pELen3ceZnOpiJdS3QjiuUb9H1XA3liDDKCI2GjIsVtACZYEKK8iRbbw
 JjpIaYMzFrEfSqrgfhVvMfy2I8vsPWEZ9ZCiPwON1eTxa4GPN/uUjaPUsciWsmqw8QiFBgPlGek
 EJs7I=
X-Received: by 2002:a5d:6449:0:b0:207:a1f4:b52 with SMTP id
 d9-20020a5d6449000000b00207a1f40b52mr8346797wrw.511.1649697783187; 
 Mon, 11 Apr 2022 10:23:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9/QqhsnrSaZRL1GMgcEIcXjRZ6+2h31Ui+q+iGEoCJSxaNvqBFRuLloksNcNEYs4PKgYlJA==
X-Received: by 2002:a5d:6449:0:b0:207:a1f4:b52 with SMTP id
 d9-20020a5d6449000000b00207a1f40b52mr8346769wrw.511.1649697782711; 
 Mon, 11 Apr 2022 10:23:02 -0700 (PDT)
Received: from [192.168.21.20]
 (host86-140-101-80.range86-140.btcentralplus.com. [86.140.101.80])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c214800b0038ec51d544csm114139wml.27.2022.04.11.10.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 10:23:02 -0700 (PDT)
Message-ID: <0a33793ae6a05b492a899ffbde9a8533d14c7faf.camel@redhat.com>
Subject: Samba in Containers/Kubernetes Status Update 2
To: samba-technical@lists.samba.org
Date: Mon, 11 Apr 2022 18:23:00 +0100
User-Agent: Evolution 3.42.2 (3.42.2-1.module_f35+13513+2c5bddf4)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sprabhu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
From: Sachin Prabhu via samba-technical <samba-technical@lists.samba.org>
Reply-To: sprabhu@redhat.com
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Samba in Containers & Kubernetes Status Update vol. 2

We are a small team within Red Hat working on an effort to export SMB
shares via Samba in the container ecosystem and Kubernetes. The last
status update email was sent by John Mulligan on 18 Oct 2021. This
email contains a status update documenting our work on this project
since then. This is also an invitation for more community participation
in the project. 

We have had a productive quarter which includes several new
improvements and features.

Clustering/CTDB: 

High Availability is provided by the CTDB service. This feature is
currently marked as experimental in the project. New features added
bring us closer to our goal of providing a reliable service to export
SMB shares.

This includes adding readiness probes to automatically detect node
failures and to disable them. 
https://github.com/samba-in-kubernetes/samba-operator/issues/135

We have also added support to scale out CTDB clusters to keep up with
increasing workloads.
https://github.com/samba-in-kubernetes/samba-operator/issues/120

Anoop CS has been working on setting up a multi-node Kubernetes testing
on the CentOS-CI infrastructure where the clustered features of the
operators are now tested regularly.
https://github.com/samba-in-kubernetes/samba-operator/issues/121

CTDB/Multus:

John Mulligan has been running tests to check the feasibility of having
CTDB manage public-facing ip addresses using Multus to provide the
required NICs within the container. The expectation was to see faster
failover with Windows-based systems using tickle-acks. Unfortunately,
the failovers are taking longer than expected. This is still a work in
progress and further updates will be provided as we make progress on
this feature.

Metrics:

Shachar Sharon has been working on adding a sidecar container to each
SmbShare resource, which exports metrics via Prometheus. This container
consumes data from the smbstatus command and exposes it via HTTP as
standard Prometheus metrics.  Although built for the container
environment, smbmetrics may also be used in other situations where
smbstatus stats are available.
We are closely following the merge request to add json support for the
smbstatus output. This will simplify the code for the consumption of
data.
https://github.com/samba-in-kubernetes/samba-operator/pull/160
https://github.com/samba-in-kubernetes/smbmetrics

Specify PVC-Path:

This feature allows users to specify a path to export from within a PV.
Building onto this work, John is working on features that will allow
the operator to detect if a new SmbShare can be serviced by an existing
SmbShare repo. 

CI infrastructure:

As mentioned earlier, Anoop has been working on improving the CI
infrastructure. The project now takes advantage of the CentOS-CI
infrastructure which provides us with more resources for our test
environments. 
https://jenkins-samba.apps.ocp.ci.centos.org/view/SINK/

Others:

Updates were made to the base versions of the container as well as the
Go version used. The developer workflow has been improved with new
makefile targets to simplify the tasks of the developer. There have
been some additions to the documentation too. We would like to thank
Tobias Florek for his help in this effort.

John has proposed a new merge request to add python bindings for the
lib/smbconf API to allow programmatic access to the Samba
configuration. More information is available at
https://gitlab.com/samba-team/samba/-/merge_requests/2469

We look forward to the upcoming SambaXP where John will be providing
further updates on Samba in Kubernetes. The talk is scheduled for 15:30
on 2022-06-01.

Thank you,
Sachin Prabhu


